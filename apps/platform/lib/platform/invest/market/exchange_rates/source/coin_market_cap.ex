defmodule Platform.ExchangeRates.Source.CoinMarketCap do
  @moduledoc """
  Adapter for fetching exchange rates from https://coinmarketcap.com.
  """
  import Ecto.Query
  alias Platform.Tokens.Token
  alias HTTPoison.{Error, Response}
  alias Platform.Repo

  @behaviour Source

  @impl Source
  def fetch_exchange_rates() do
    case HTTPoison.get(source_url(), headers()) do
      {:ok, %Response{body: body, status_code: 200}} ->
        {:ok, format_data(body)}

      {:ok, %Response{body: body, status_code: status_code}} when status_code in 400..499 ->
        IO.inspect(['RRRRRRRR', body, status_code])
        {:error, body}

      {:error, %Error{reason: reason}} ->
        {:error, reason}
    end
  end

  defp headers() do
    api_key = Application.get_env(:platform, Platform.ExchangeRates, [])[:api_key]
    [{"Content-Type", "application/json"}, {"X-CMC_PRO_API_KEY", api_key}]
  end

  @doc false
  def format_data(data) do
    for item <- decode_json(data), not is_nil(item["last_updated"]) do
      {last_updated_as_unix, _} = Integer.parse(item["last_updated"])
      last_updated = DateTime.from_unix!(last_updated_as_unix)

      %Token{
        cmc_id: item["id"],
        name: item["name"],
        symbol: item["symbol"],
        platform_id: to_decimal(item["platform"]["id"]),
        platform_name: to_decimal(item["platform"]["name"]),
        usd_price: to_decimal(item["quote"]["USD"]["price"]),
        btc_price: to_decimal(item["quote"]["BTC"]["price"]),
        market_cap_usd: to_decimal(item["quote"]["USD"]["market_cap"]),
        market_cap_btc: to_decimal(item["quote"]["BTC"]["market_cap"]),
        percent_change_1h: to_decimal(item["quote"]["percent_change_1h"]),
        percent_change_24h: to_decimal(item["quote"]["percent_change_24h"]),
        percent_change_7d: to_decimal(item["quote"]["percent_change_7d"]),
        percent_change_30d: to_decimal(item["quote"]["percent_change_30d"]),
        volume_1h: to_decimal(item["quote"]["volume_1h"]),
        volume_24h: to_decimal(item["quote"]["volume_24h"]),
        volume_7d: to_decimal(item["quote"]["volume_7d"]),
        volume_30d: to_decimal(item["quote"]["volume_30d"]),
        total_supply: to_decimal(item["total_supply"]),
        max_supply: to_decimal(item["max_supply"]),
        circulating_supply: to_decimal(item["circulating_supply"]),
        last_updated: last_updated
      }
    end
  end

  defp base_url do
    configured_url = Application.get_env(:platform, __MODULE__, [])[:base_url]
    configured_url || "https://pro-api.coinmarketcap.com"
  end

  defp decode_json(data) do
    Jason.decode!(data)
  end

  defp to_decimal(nil), do: nil

  defp to_decimal(value) do
    Decimal.new(value)
  end

  defp source_url do
    aux = "quote,market_cap_by_total_supply,cmc_rank,tags,
      last_updated,platform,max_supply,circulating_supply,
      total_supply,is_active,is_fiat"

    q =
      from(
        t in Token,
        select: [:cmc_id],
        limit: 1
      )

    cmc_ids =
      Repo.all(q)
      |> Enum.map(fn t -> t.cmc_id end)
      |> Enum.filter(&(!is_nil(&1)))
      |> Enum.join(",")

    convert = [1, 2781] |> Enum.join(",")

    URI.encode(
      "#{base_url()}/v1/cryptocurrency/listings/latest?aux=#{aux}&id=#{cmc_ids}&convert_id=#{
        convert
      }}"
    )
  end
end
