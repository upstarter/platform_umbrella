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
      token_info: token.token_info,
      daily_market_history:
        render_many(
          token.daily_market_history,
          DailyMarketHistoryView,
          "daily_market_history.json"
        )
    }
  end

  def render("token_info.json", %{token_info: token_info}) do
    %{
      btc_price: token_info.btc_price,
      usd_price: token_info.usd_price,
      cmc_id: token_info.cmc_id,
      market_cap_usd: token_info.market_cap_usd,
      market_cap_btc: token_info.market_cap_btc,
      circulating_supply: token_info.circulating_supply,
      total_supply: token_info.total_supply,
      max_supply: token_info.max_supply,
      platform_id: token_info.platform_id,
      platform_name: token_info.platform_name,
      percent_change_1h: token_info.percent_change_1h,
      percent_change_24h: token_info.percent_change_24h,
      percent_change_7d: token_info.percent_change_7d,
      percent_change_30d: token_info.percent_change_30d,
      percent_change_60d: token_info.percent_change_60d,
      percent_change_90d: token_info.percent_change_90d,
      volume_24h: token_info.volume_24h,
      volume_7d: token_info.volume_7d,
      volume_30d: token_info.volume_30d
    }
  end
end
