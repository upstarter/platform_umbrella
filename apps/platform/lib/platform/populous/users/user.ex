defmodule Platform.Users.User do
  use Ecto.Schema
  # use GuardianTrackable.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias Platform.Repo
  alias Platform.Auth.Credential
  alias Platform.Accounts.Account
  alias Platform.Topics.Topic
  alias Platform.Tokens.Token
  alias Platform.Portfolios.Portfolio

  alias Platform.Users.{
    User,
    UsersTopics,
    Tokens.UserToken,
    Portfolios.UserPortfolio,
    Portfolios.PortfolioToken,
    Profiles.UserProfile,
    Profiles.UserRole,
    Profiles.Role,
    Groups.UserGroup,
    Proposal
  }

  # @type t :: %__MODULE__{
  #         id: integer,
  #         email: String.t(),
  #         password_hash: String.t(),
  #         confirmed_at: DateTime.t() | nil,
  #         reset_sent_at: DateTime.t() | nil,
  #         sessions: [Session.t()] | %Ecto.Association.NotLoaded{},
  #         inserted_at: DateTime.t(),
  #         updated_at: DateTime.t()
  #       }

  schema "users" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:nickname, :string)
    field(:email, :string)
    field(:terms_accepted, :boolean)

    has_one(:user_profile, UserProfile)

    has_many(:user_roles, UserRole, on_delete: :delete_all)
    has_many(:roles, through: [:user_roles, :role], on_delete: :delete_all)

    has_many(:credentials, Credential, on_delete: :delete_all)
    has_many(:accounts, Account, on_delete: :delete_all)
    has_many(:proposals, Proposal)

    has_many(:user_groups, UserGroup,
      foreign_key: :member_id,
      on_delete: :delete_all
    )

    has_many(:groups, through: [:user_groups, :group])

    many_to_many(:topics, Topic, join_through: UsersTopics, on_delete: :delete_all)

    has_many(:user_portfolios, UserPortfolio, on_delete: :delete_all)

    many_to_many(:portfolios, Portfolio,
      join_through: UserPortfolio,
      on_delete: :delete_all
    )

    has_many(:portfolio_tokens,
      through: [:user_portfolios, :portfolio_tokens],
      on_delete: :delete_all
    )

    # many_to_many(:tokens, Token, join_through: PortfolioToken, on_delete: :delete_all)

    # many_to_many(:tokens, Token,
    #   join_through: PortfolioToken,
    #   on_delete: :delete_all
    # )

    # many_to_many(:tokens, Token,
    #   join_through: UserPortfolio,
    #   on_delete: :delete_all
    # )

    # guardian_trackable()
    timestamps()
  end

  defdelegate roles, to: UserProfile

  def assets(user_id) do
    # query =
    #   from(u in User,
    #     where: u.id == ^user_id,
    #     left_join: user_portfolios in assoc(u, :user_portfolios),
    #     left_join: portfolio_tokens in assoc(user_portfolios, :portfolio_tokens),
    #     preload: :portfolio_tokens
    #   )

    query =
      from(u in User,
        where: u.id == ^user_id,
        left_join: user_portfolios in assoc(u, :user_portfolios),
        left_join: portfolio_tokens in assoc(u, :portfolio_tokens),
        preload: [user_portfolios: [:portfolio_tokens, :tokens]],
        preload: [:portfolio_tokens]
        # preload: [user_portfolios: :tokens]
      )

    user = Repo.all(query)
  end

  defp has_role?(nil, _roles), do: false
  defp has_role?(user, roles) when is_list(roles), do: Enum.any?(roles, &has_role?(user, &1))
  defp has_role?(user, role) when is_atom(role), do: has_role?(user, Atom.to_string(role))
  defp has_role?(%{role: role}, role), do: true
  defp has_role?(_user, _role), do: false

  def validate(%Ecto.Changeset{} = changeset) do
    changeset
    |> validate_required([:email])
    |> validate_length(:email, min: 1, max: 30)
  end

  @doc false
  def registration_changeset(user, params) do
    user
    |> cast(params, [:email, :nickname])
    |> validate_format(:email, ~r/@/)
    |> validate_required([:email, :topics])
    |> unique_constraint(:email)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :nickname])
    |> validate_format(:email, ~r/@/)
    |> validate_required([:email])
  end
end
