defmodule Platform.Users.User do
  use Ecto.Schema
  # use GuardianTrackable.Schema
  import Ecto.Changeset
  alias Platform.Repo
  alias Platform.Topics.Topic
  alias Platform.Portfolios.Portfolio

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

    has_many(:credentials, Platform.Auth.Credential, on_delete: :delete_all)
    has_many(:accounts, Platform.Accounts.Account, on_delete: :delete_all)
    has_many(:proposals, Platform.Users.Proposal)

    has_many(:groupings, Platform.Groupings.Grouping,
      foreign_key: :member_id,
      on_delete: :delete_all
    )

    has_many(:groups, through: [:groupings, :group])

    many_to_many(:topics, Topic, join_through: Platform.Users.UsersTopics)
    many_to_many(:portfolios, Portfolio, join_through: "users_portfolios")

    # guardian_trackable()
    timestamps()
  end

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
