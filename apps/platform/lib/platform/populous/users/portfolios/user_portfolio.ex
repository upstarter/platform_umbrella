defmodule Platform.Users.Portfolios.UserPortfolio do
  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Repo
  alias Platform.Portfolios.Portfolio
  alias Platform.Users.Portfolios.UserPortfolio
  alias Platform.Users.Portfolios.PortfolioToken
  alias Platform.Tokens.Token
  alias Platform.Users.User

  schema "user_portfolios" do
    belongs_to(:portfolio, Portfolio)
    belongs_to(:user, User)
    has_many(:portfolio_tokens, PortfolioToken, foreign_key: :portfolio_id, on_replace: :nilify)
    has_many(:tokens, through: [:portfolio_tokens, :token])

    timestamps()
  end

  # def load_portfolio_tokens(params) do
  #   case params[""] || [] do
  #     [] -> []
  #     ids -> Repo.all(from(r in PortfolioToken, where: r.id in ^ids))
  #   end
  # end

  def old_update(portfolio_params) do
    user_id = String.to_integer(portfolio_params["portfolio"]["user_id"])
    portfolio = Map.drop(portfolio_params["portfolio"], ["user_id", "name"]) |> Map.values()
    dt = NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)

    folio = Repo.get!(Portfolio, 1)

    user_portfolio = Repo.get(UserPortfolio, 1)

    attrs = %{
      user_id: user_id,
      portfolio_id: folio.id
    }

    user_portfolio =
      if user_portfolio do
        user_portfolio
        |> UserPortfolio.changeset(attrs)
        |> Repo.update!()
      else
        %UserPortfolio{}
        |> UserPortfolio.changeset(attrs)
        |> Repo.insert!()
      end

    user_portfolio = user_portfolio |> Repo.preload(:portfolio_tokens)

    pt =
      for holding <- portfolio do
        tok =
          Ecto.build_assoc(user_portfolio, :portfolio_tokens, %{
            portfolio_id: user_portfolio.id,
            token_id: holding["id"],
            user_id: user_id,
            weight: holding["weight"],
            inserted_at: dt,
            updated_at: dt
          })

        Repo.update(tok)
        Map.from_struct(tok)
      end
  end

  def update(portfolio_params) do
    user_id = String.to_integer(portfolio_params["portfolio"]["user_id"])
    portfolio = Map.drop(portfolio_params["portfolio"], ["user_id", "name"]) |> Map.values()
    dt = NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)

    folio = Repo.get!(Portfolio, 1)

    user_portfolio =
      Repo.get_by(UserPortfolio,
        user_id: user_id,
        portfolio_id: folio.id
      )
      |> Repo.preload([:portfolio_tokens])

    # require IEx
    # IEx.pry()

    attrs = %{
      user_id: user_id,
      portfolio_id: folio.id
    }

    user_portfolio =
      if user_portfolio do
        user_portfolio
        |> UserPortfolio.changeset(attrs)
        |> Repo.update!()
      else
        %UserPortfolio{}
        |> UserPortfolio.changeset(attrs)
        |> Repo.insert!()
      end

    pt =
      for holding <- portfolio do
        portfolio_token =
          Repo.get_by(PortfolioToken,
            user_id: user_id,
            portfolio_id: folio.id,
            token_id: holding["id"]
          )

        portfolio_token =
          if portfolio_token do
            portfolio_token
            |> PortfolioToken.changeset(attrs)
            |> Repo.update!()
          else
            portfolio_token =
              %PortfolioToken{
                portfolio_id: folio.id,
                token_id: holding["id"],
                user_id: user_id,
                weight: holding["weight"],
                inserted_at: dt,
                updated_at: dt
              }
              |> PortfolioToken.changeset(attrs)
              |> Repo.insert!()
          end

        up_changeset = Ecto.Changeset.change(user_portfolio)
        p = Ecto.Changeset.put_assoc(up_changeset, :portfolio_tokens, [portfolio_token])
        Repo.update!(p)
      end

    {:ok, user_portfolio}
  end

  def insert_user_portfolio(Platform.Repo, _changes, portfolio_params) do
    user_id = String.to_integer(portfolio_params["portfolio"]["user_id"])
    portfolio = Map.drop(portfolio_params["portfolio"], ["user_id", "name"]) |> Map.values()
    dt = NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)
    Repo.delete_all(PortfolioToken)
    Repo.delete_all(UserPortfolio)

    # Ecto was trying to insert the parent record along with the child record.
    # As noted in that linked article, the correct way to insert a child record
    # with a parent association is to either build the association using
    # build_assoc/3 from the parent record, or, in more complex casts, put the
    # parent foreign key in the parameters of the child record and pass that to
    # the changeset.
    folio = Repo.get!(Portfolio, 1)

    user_portfolio =
      Ecto.Changeset.change(%UserPortfolio{}, portfolio_id: folio.id, user_id: user_id)

    up = Repo.insert!(user_portfolio)

    pt =
      for holding <- portfolio do
        tok =
          Ecto.build_assoc(up, :portfolio_tokens, %{
            portfolio_id: up.id,
            token_id: holding["id"],
            user_id: user_id,
            weight: holding["weight"],
            inserted_at: dt,
            updated_at: dt
          })

        Repo.insert!(tok)
        Map.from_struct(tok)
      end

    # user_portfolio_with_tokens = Ecto.Changeset.put_assoc(up, :portfolio_tokens, pt)

    p =
      Ecto.Changeset.change(up)
      |> Repo.update!()

    # IO.inspect([num_tokens, u_tokens])
    # require IEx
    # IEx.pry()

    if p do
      # Logger.info("utokens", p)
      {:ok, p}
    else
      {:error, "user portfolio not inserted"}
    end
  end

  def create(params) do
    Ecto.Multi.new()
    |> Ecto.Multi.run(:user_portfolio, __MODULE__, :insert_user_portfolio, [params])
    |> Platform.Repo.transaction()
    |> case do
      {:ok, %{user_portfolio: user_portfolio}} ->
        user_portfolio = user_portfolio |> Platform.Repo.preload(:user)
        {:ok, user_portfolio}

      # matches when insert_portfolio_tokens fails
      {:error, :portfolio, changeset, _changes_so_far} ->
        # to be used on form again
        {:error, changeset}

      # shared schema magic
      # matches when user, user_topics or credential failed op
      # registration_changeset = successful changes so far
      {:error, _failed_op, changeset, %{portfolio: portfolio_changeset}} ->
        portfolio_changeset = %{
          portfolio_changeset
          | errors: changeset.errors,
            action: changeset.action
        }

        {:error, portfolio_changeset}
    end
  end

  @doc false
  def changeset(user_portfolio, attrs) do
    user_portfolio
    |> cast(attrs, [:user_id, :portfolio_id])
    |> foreign_key_constraint(:portfolio_id)
    |> foreign_key_constraint(:user_id)
    |> cast_assoc(:portfolio_tokens, required: true)
    |> validate_required([:user_id, :portfolio_id])
    |> unique_constraint(:user_portfolios, [:user_id, :portfolio_id])
  end
end
