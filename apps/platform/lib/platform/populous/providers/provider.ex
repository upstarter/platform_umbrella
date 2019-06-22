defmodule Platform.Providers.Provider do
  @moduledoc """

    providers of services on the platform

  """

  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Auth.Account
  alias Platform.Topics.Topic
  alias Platform.Portfolios.Portfolio

  schema "providers" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:email, :string)
    field(:phone, :string)
    field(:avatar_url, :string)
    field(:auth_account_id, :integer)
    # field(:description, :string) # provider profile
    many_to_many(:topics, Topic, join_through: "providers_topics")
    many_to_many(:portfolios, Portfolio, join_through: "providers_portfolios")

    timestamps()
  end

  def changeset(provider, attrs) do
    provider
    |> cast(attrs, [:auth_account_id, :name, :desc])
    |> validate_required([:auth_account_id, :name, :desc])
  end
end
