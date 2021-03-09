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
      btc_price: token.btc_price,
      usd_price: token.usd_price,
      cmc_id: token.cmc_id,
      market_cap_usd: token.market_cap_usd,
      market_cap_btc: token.market_cap_btc,
      circulating_supply: token.circulating_supply,
      total_supply: token.total_supply,
      max_supply: token.max_supply,
      platform_id: token.platform_id,
      platform_name: token.platform_name,
      percent_change_1h: token.percent_change_1h,
      percent_change_24h: token.percent_change_24h,
      percent_change_7d: token.percent_change_7d,
      percent_change_30d: token.percent_change_30d,
      percent_change_60d: token.percent_change_60d,
      percent_change_90d: token.percent_change_90d,
      volume_24h: token.volume_24h,
      volume_7d: token.volume_7d,
      volume_30d: token.volume_30d,
      daily_market_history:
        render_many(
          token.daily_market_history,
          DailyMarketHistoryView,
          "daily_market_history.json"
        )
    }
  end
end
