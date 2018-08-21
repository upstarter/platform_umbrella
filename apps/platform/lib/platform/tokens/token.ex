defmodule Platform.Tokens.Token do
  @moduledoc """

    tokens on the platform

  """

  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Providers.Provider

  schema "tokens" do
    field(:img_url, :string)
    field(:name, :string)
    field(:short_desc, :string)
    field(:site, :string)
    field(:ticker, :string)
    many_to_many(:portfolios_tokens, Provider, join_through: "providers_topics")

    timestamps()
  end

  @doc false
  def changeset(token, attrs) do
    token
    |> cast(attrs, [:ticker, :name, :site, :short_desc, :img_url])
    |> validate_required([:ticker, :name, :site, :short_desc, :img_url])
  end
end
