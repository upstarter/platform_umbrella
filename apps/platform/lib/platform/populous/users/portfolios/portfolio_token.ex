defmodule Platform.Users.Portfolios.PortfolioToken do
  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Tokens.Token
  alias Platform.Users.Portfolios.UserPortfolio

  alias Platform.Users.User

  schema "portfolios_tokens" do
    belongs_to(:user_portfolio, UserPortfolio, foreign_key: :portfolio_id, on_replace: :nilify)
    belongs_to(:user, User)
    belongs_to(:token, Token)

    field(:weight, :integer, default: 0)

    timestamps()
  end

  @doc false
  def changeset(portfolio_token, attrs) do
    portfolio_token
    |> cast(attrs, [:portfolio_id, :token_id, :user_id])
    |> foreign_key_constraint(:portfolio_id)
    |> validate_required([:portfolio_id, :token_id, :user_id])
    |> unique_constraint(:portfolios_tokens, [:user_id, :portfolio_id, :token_id])
  end
end
