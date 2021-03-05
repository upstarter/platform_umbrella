defmodule PlatformWeb.V1.DailyMarketHistory.DailyMarketHistoryView do
  use PlatformWeb, :view
  alias PlatformWeb.V1.DailyMarketHistory.DailyMarketHistoryView
  alias Platform.Market.DailyMarketHistory

  def render("index.json", %{daily_market_history: daily_market_history}) do
    %{
      data: render_many(daily_market_history, DailyMarketHistoryView, "daily_market_history.json")
    }
  end

  def render("show.json", %{daily_market_history: daily_market_history}) do
    %{data: render_one(daily_market_history, DailyMarketHistoryView, "daily_market_history.json")}
  end

  def render("daily_market_history.json", %{daily_market_history: daily_market_history}) do
    %{
      id: daily_market_history.id,
      date: daily_market_history.date,
      symbol: daily_market_history.symbol,
      low: daily_market_history.low,
      open: daily_market_history.open,
      close: daily_market_history.close,
      high: daily_market_history.high,
      volumefrom: daily_market_history.volumefrom,
      volumeto: daily_market_history.volumeto,
      token_id: daily_market_history.token_id
    }
  end
end
