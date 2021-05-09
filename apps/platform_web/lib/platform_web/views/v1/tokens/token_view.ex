defmodule PlatformWeb.V1.Tokens.TokenView do
  use PlatformWeb, :view
  use Number
  alias PlatformWeb.V1.Tokens.TokenView
  alias PlatformWeb.V1.DailyMarketHistory.DailyMarketHistoryView

  def render("index.json", %{tokens: tokens}) do
    %{data: render_many(tokens, TokenView, "token.json")}
  end

  def render("show.json", %{token: token}) do
    %{data: render_one(token, TokenView, "token.json")}
  end

  def render("token.json", %{token: token}) do
    isDecimal? = fn {k, v} ->
      case v do
        %Decimal{} = v ->
          true

        v when is_binary(v) ->
          true

        _ ->
          false
      end
    end

    round = fn {k, v} ->
      case v do
        %Decimal{} = v ->
          {k, Decimal.round(v, 2)}

        _ ->
          {k, v}
      end
    end

    token_info =
      if token.token_info do
        Map.from_struct(token.token_info)
        |> Enum.reduce([], fn {k, v}, acc ->
          if isDecimal?.({k, v}) do
            [round.({k, v}) | acc]
          else
            [{k, v} | acc]
          end
        end)
        |> Enum.into(%{})
      else
        %{}
      end

    token = %{
      id: token.id,
      name: token.name,
      symbol: token.symbol,
      description: token.description,
      token_info: token_info,
      daily_market_history:
        render_many(
          token.daily_market_history,
          DailyMarketHistoryView,
          "daily_market_history.json"
        )
    }

    token
  end

  def render("token_info.json", %{token_info: token_info}) do
    %{
      btc_price: Float.round(token_info.btc_price, 2),
      usd_price: Float.round(token_info.usd_price, 2),
      cmc_id: Float.round(token_info.cmc_id, 2),
      market_cap_usd: Float.round(token_info.market_cap_usd, 2),
      market_cap_btc: Float.round(token_info.market_cap_btc, 2),
      circulating_supply: Float.round(token_info.circulating_supply, 2),
      total_supply: Float.round(token_info.total_supply, 2),
      max_supply: Float.round(token_info.max_supply, 2),
      platform_id: token_info.platform_id,
      platform_name: token_info.platform_name,
      percent_change_1h: Float.round(token_info.percent_change_1h, 2),
      percent_change_24h: Float.round(token_info.percent_change_24h, 2),
      percent_change_7d: Float.round(token_info.percent_change_7d, 2),
      percent_change_30d: Float.round(token_info.percent_change_30d, 2),
      percent_change_60d: Float.round(token_info.percent_change_60d, 2),
      percent_change_90d: Float.round(token_info.percent_change_90d, 2),
      volume_24h: Float.round(token_info.volume_24h, 2),
      volume_7d: Float.round(token_info.volume_7d, 2),
      volume_30d: Float.round(token_info.volume_3, 20),
      tags: token_info.tags
    }
  end
end
