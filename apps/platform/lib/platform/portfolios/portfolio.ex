defmodule Platform.Portfolios.Portfolio do
  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Providers.Provider
  alias Platform.Tokens.Token

  schema "portfolios" do
    field(:name, :string)
    field(:description, :string)
    many_to_many(:providers, Provider, join_through: "providers_portfolios")
    many_to_many(:tokens, Token, join_through: "portfolios_tokens")

    timestamps()
  end

  @doc false
  def changeset(portfolio, attrs) do
    portfolio
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
