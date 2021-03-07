defmodule Platform.ExchangeRates.Source.CoinMarketCap do
  @moduledoc """
  Adapter for fetching exchange rates from https://coinmarketcap.com.
  """
  import Ecto.Query
  alias Platform.ExchangeRates.Token
  alias HTTPoison.{Error, Response}
  alias Platform.Repo

  @behaviour Source

  @impl Source
  def fetch_exchange_rates() do
    case HTTPoison.get(source_url(), headers()) do
      {:ok, %Response{body: body, status_code: 200}} ->
        {:ok, format_data(body)}

      {:ok, %Response{body: body, status_code: status_code}} when status_code in 400..499 ->
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
      IO.inspect(['item', item])
      {last_updated_as_unix, _} = Integer.parse(item["last_updated"])
      last_updated = DateTime.from_unix!(last_updated_as_unix)

      %Token{
        id: item["id"],
        name: item["name"],
        symbol: item["symbol"],
        total_supply: to_decimal(item["total_supply"]),
        max_supply: to_decimal(item["max_supply"]),
        circulating_supply: to_decimal(item["circulating_supply"]),
        last_updated: last_updated,
        platform_id: to_decimal(item["platform"]["id"]),
        platform_name: to_decimal(item["platform"]["name"]),
        usd_value: Decimal.from_float(item["quote"]["2781"]["price"]),
        btc_value: to_decimal(item["quote"]["1"]["price"]),
        market_cap_usd: Decimal.from_float(item["quote"]["2781"]["market_cap"]),
        market_cap_btc: to_decimal(item["quote"]["1"]["market_cap"]),
        percent_change_24h: Decimal.from_float(item["quote"]["2781"]["percent_change_24h"]),
        percent_change_7d: Decimal.from_float(item["quote"]["2781"]["percent_change_7d"]),
        percent_change_30d: Decimal.from_float(item["quote"]["2781"]["percent_change_30d"]),
        volume_24h: Decimal.from_float(item["quote"]["2781"]["volume_24h"]),
        volume_7d: Decimal.from_float(item["quote"]["2781"]["volume_7d"]),
        volume_30d: Decimal.from_float(item["quote"]["2781"]["volume_30d"])
      }
    end
  end

  defp base_url do
    configured_url = Application.get_env(:platform, __MODULE__, [])[:base_url]
    configured_url || "https://pro-api.coinmarketcap.com"
  end

  defp decode_json(data) do
    [Jason.decode!(data)["data"]["1"]]
  end

  defp to_decimal(nil), do: nil

  defp to_decimal(value) do
    Decimal.new(value)
  end

  defp source_url do
    aux = ~w(
        tags
        platform
        max_supply
        circulating_supply
        total_supply
        market_cap_by_total_supply
        volume_7d
        volume_30d
        is_active
        is_fiat)

    q =
      from(
        t in Platform.Tokens.Token,
        limit: 1
      )

    id_params =
      Repo.all(q)
      |> Enum.map(fn t -> t.cmc_id end)
      |> Enum.filter(&(!is_nil(&1)))
      |> Enum.join(",")

    convert_params = "convert_id=2781&"

    aux_params = aux |> Enum.map(fn a -> "#{a}" end) |> Enum.join(",")

    query = "id=" <> id_params <> "&" <> convert_params <> "aux=#{aux_params}"
    url = URI.encode("#{base_url()}/v1/cryptocurrency/quotes/latest?#{query}")

    IO.inspect(['CCCC', query, url])
    url
  end
end
