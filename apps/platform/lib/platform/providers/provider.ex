defmodule Platform.Providers.Provider do
  @moduledoc """

    providers of services on the platform

  """

  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Users.User
  alias Platform.Topics.Topic
  alias Platform.Portfolios.Portfolio

  schema "providers" do
    field(:name, :string)
    field(:email, :string)
    field(:short_desc, :string)
    belongs_to(:user, User)
    many_to_many(:topics, Topic, join_through: "providers_topics")
    many_to_many(:portfolios, Portfolio, join_through: "providers_portfolios")

    timestamps()
  end

  def changeset(provider, attrs) do
    provider
    |> cast(attrs, [:user_id, :name, :desc])
    |> validate_required([:user_id, :name, :desc])
  end
end
