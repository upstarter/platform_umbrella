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

  @doc false
  def changeset(portfolio, attrs) do
    # require IEx
    # IEx.pry()

    portfolio
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
