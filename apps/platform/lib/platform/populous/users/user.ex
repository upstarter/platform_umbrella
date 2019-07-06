defmodule Platform.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Topics.Topic
  alias Platform.Portfolios.Portfolio

  schema "users" do
    field(:email, :string)
    field(:terms_accepted, :boolean)

    has_many(:credentials, Platform.Auth.Credential, on_delete: :delete_all)
    has_many(:accounts, Platform.Accounts.Account, on_delete: :delete_all)
    has_many(:proposals, Platform.Users.Proposal)

    has_many(:groupings, Platform.Groupings.Grouping, on_delete: :delete_all)
    has_many(:groups, through: [:groupings, :group])

    many_to_many(:topics, Topic, join_through: "users_topics")
    many_to_many(:portfolios, Portfolio, join_through: "users_portfolios")

    timestamps()
  end

  def validate(%Ecto.Changeset{} = changeset) do
    changeset
    |> validate_required([:email])
    |> validate_length(:email, min: 1, max: 30)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email])
    |> validate_format(:email, ~r/@/)
    |> validate_required([:email])
  end
end
