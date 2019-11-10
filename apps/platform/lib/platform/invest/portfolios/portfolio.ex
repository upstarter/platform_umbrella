defmodule Platform.Portfolios.Portfolio do
  use Ecto.Schema
  require Logger
  import Ecto.Changeset
  import Ecto.Query
  alias Platform.Repo
  alias Platform.Users.User
  alias Platform.Tokens.Token
  alias Platform.Portfolios.Portfolio
  alias Platform.Users.Portfolios.UserPortfolio
  alias Platform.Users.Portfolios.PortfolioToken

  schema "portfolios" do
    field(:name, :string)
    field(:description, :string)
    many_to_many(:users, User, join_through: UserPortfolio)
    many_to_many(:tokens, Token, join_through: PortfolioToken)

    timestamps()
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

  # def create(params) do
  #   insert_user_portfolio(params)
  #   insert_portfolio_tokens(params)
  # end

  def insert_user_portfolio(Platform.Repo, _changes, portfolio_params) do
    user_id = String.to_integer(portfolio_params["portfolio"]["user_id"])
    portfolio = Map.drop(portfolio_params["portfolio"], ["user_id", "name"]) |> Map.values()
    dt = NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)
    Repo.delete_all(PortfolioToken)
    Repo.delete_all(UserPortfolio)

    # The reason I was having issues inserting records with associations was because
    # of the way I defined the association. Ecto was trying to insert the parent
    # record along with the child record. As noted in that linked article, the correct
    # way to insert a child record with a parent association is to either build the
    # the association using build_assoc/3 from the parent record, or, in more complex
    # casts, put the parent foreign key in the parameters of the child record and pass
    # that to the changeset.
    folio = Repo.get!(Portfolio, 1)

    user_portfolio =
      Ecto.Changeset.change(%UserPortfolio{}, portfolio_id: folio.id, user_id: user_id)

    up = Repo.insert!(user_portfolio)

    pt =
      for holding <- portfolio do
        tok =
          Ecto.build_assoc(up, :portfolio_tokens, %{
            token_id: holding["id"],
            user_id: user_id,
            weight: holding["weight"],
            inserted_at: dt,
            updated_at: dt
          })

        Map.from_struct(tok)
      end

    # require IEx
    # IEx.pry()

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

  @doc false
  def changeset(portfolio, attrs) do
    # require IEx
    # IEx.pry()

    portfolio
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
