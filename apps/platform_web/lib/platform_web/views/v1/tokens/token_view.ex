defmodule PlatformWeb.V1.Tokens.TokenView do
  use PlatformWeb, :view
  alias PlatformWeb.V1.Tokens.TokenView
  alias PlatformWeb.V1.DailyMarketHistory.DailyMarketHistoryView

  def render("index.json", %{tokens: tokens}) do
    %{data: render_many(tokens, TokenView, "token.json")}
  end

  def render("show.json", %{token: token}) do
    %{data: render_one(token, TokenView, "token.json")}
  end

  def render("token.json", %{token: token}) do
    %{
      id: token.id,
      name: token.name,
      symbol: token.symbol,
      description: token.description,
      daily_market_history:
        render_many(
          token.daily_market_history,
          DailyMarketHistoryView,
          "daily_market_history.json"
        )
    }
  end
end
