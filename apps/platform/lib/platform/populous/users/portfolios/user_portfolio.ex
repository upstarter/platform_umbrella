defmodule Platform.Users.Portfolios.UserPortfolio do
  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Users.Portfolios.Portfolio
  alias Platform.Users.Portfolios.PortfolioToken
  alias Platform.Tokens.Token
  alias Platform.Users.User

  schema "user_portfolios" do
    belongs_to(:portfolio, Portfolio)
    belongs_to(:user, User)
    has_many(:portfolio_tokens, PortfolioToken, foreign_key: :portfolio_id)
    has_many(:tokens, through: [:portfolio_tokens, :token])

    timestamps()
  end

  @doc false
  def changeset(user_portfolio, attrs) do
    user_portfolio
    |> cast(attrs, [:user_id, :portfolio_id])
    |> foreign_key_constraint(:portfolios_tokens, name: :portfolios_tokens_portfolio_id_fkey)
    |> cast_assoc(:portfolio_tokens, required: true)
    # |> foreign_key_constraint(:portfolio_tokens, name: :portfolios_tokens_portfolio_id_fkey)
    |> validate_required([:user_id, :portfolio_id])
    |> unique_constraint(:user_portfolios, [:user_id, :portfolio_id])
  end
end
