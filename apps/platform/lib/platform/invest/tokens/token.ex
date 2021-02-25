defmodule Platform.Tokens.Token do
  @moduledoc """

    tokens on the platform

  """

  use Ecto.Schema
  import Ecto.Changeset

  alias Platform.Users.User
  alias Platform.Topics.Topic

  @derive {Jason.Encoder, only: [:id, :name, :description, :symbol]}
  schema "tokens" do
    field(:name, :string)
    field(:symbol, :string)
    field(:img_url, :string)
    field(:description, :string)
    field(:site, :string)
    field(:available_supply, :decimal)
    field(:btc_value, :decimal)
    field(:last_updated, :utc_datetime)
    field(:market_cap_usd, :decimal)
    field(:usd_value, :decimal)
    field(:volume_24h_usd, :decimal)

    many_to_many(:users_tokens, User, join_through: "users_tokens")
    many_to_many(:topics, Topic, join_through: "topics_tokens")

    timestamps()
  end

  @doc false
  def changeset(token, attrs) do
    token
    |> cast(attrs, [:ticker, :name, :site, :description, :img_url])
    |> validate_required([:ticker, :name, :site, :description, :img_url])
  end
end
