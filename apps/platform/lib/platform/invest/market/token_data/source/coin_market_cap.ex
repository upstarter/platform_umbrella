defmodule Platform.Market.TokenCache.Source.CoinMarketCap do
  @moduledoc """
  Adapter for fetching token data from https://coinmarketcap.com.
  """
  import Ecto.Query
  alias Platform.Market.TokenCache.CacheToken
  alias HTTPoison.{Error, Response}
  alias Platform.Repo
  alias Platform.Market.TokenCache.Source

  @behaviour Source

  @impl Source
  def fetch_token_data() do
    case HTTPoison.get(source_url(), headers()) do
      {:ok, %Response{body: body, status_code: 200}} ->
        {:ok, handle_response(body)}

      {:ok, %Response{body: body, status_code: status_code}} when status_code in 400..499 ->
        {:error, body}

      {:error, %Error{reason: reason}} ->
        {:error, reason}
    end
  end

  defp headers() do
    api_key = Application.get_env(:platform, Platform.Market.TokenCache, [])[:api_key]
    [{"Content-Type", "application/json"}, {"X-CMC_PRO_API_KEY", api_key}]
  end

  defp handle_response(body) do
    tokens = format_data(body)

    tokens
  end

  @doc false
  def format_data(body) do
    for {_id, item} <- decode_json(body), not is_nil(item["last_updated"]) do
      {last_updated_as_unix, _} = Integer.parse(item["last_updated"])
      last_updated = DateTime.from_unix!(last_updated_as_unix)

      btc_price =
        item["quote"]["1"]["price"] &&
          Decimal.from_float(item["quote"]["1"]["price"] / 1) |> Decimal.round(2)

      market_cap_btc =
        item["quote"]["1"]["market_cap"] &&
          Decimal.from_float(item["quote"]["1"]["market_cap"] / 1) |> Decimal.round(2)

      %CacheToken{
        id: item["id"],
        name: item["name"],
        symbol: item["symbol"],
        tags: item["tags"],
        total_supply:
          item["total_supply"] && Decimal.from_float(item["total_supply"] / 1) |> Decimal.round(2),
        max_supply:
          item["max_supply"] && Decimal.from_float(item["max_supply"] / 1) |> Decimal.round(2),
        circulating_supply:
          item["circulating_supply"] &&
            Decimal.from_float(item["circulating_supply"] / 1) |> Decimal.round(2),
        last_updated: last_updated,
        platform_id: item["platform"]["id"],
        platform_name: to_string(item["platform"]["name"]),
        usd_price: Decimal.from_float(item["quote"]["2781"]["price"]) |> Decimal.round(2),
        btc_price: btc_price,
        market_cap_usd:
          Decimal.from_float(item["quote"]["2781"]["market_cap"] / 1) |> Decimal.round(2),
        market_cap_btc: market_cap_btc,
        percent_change_24h:
          Decimal.from_float(item["quote"]["2781"]["percent_change_24h"] / 1) |> Decimal.round(2),
        percent_change_7d:
          Decimal.from_float(item["quote"]["2781"]["percent_change_7d"] / 1) |> Decimal.round(2),
        percent_change_30d:
          Decimal.from_float(item["quote"]["2781"]["percent_change_30d"] / 1) |> Decimal.round(2),
        volume_24h:
          Decimal.from_float(item["quote"]["2781"]["volume_24h"] / 1) |> Decimal.round(2),
        volume_7d: Decimal.from_float(item["quote"]["2781"]["volume_7d"] / 1) |> Decimal.round(2),
        volume_30d:
          Decimal.from_float(item["quote"]["2781"]["volume_30d"] / 1) |> Decimal.round(2)
      }
    end
  end

  defp base_url do
    configured_url = Application.get_env(:platform, __MODULE__, [])[:base_url]
    configured_url || "https://pro-api.coinmarketcap.com"
  end

  defp decode_json(body) do
    Jason.decode!(body)["data"]
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

    q = from(t in Platform.Tokens.Token)

    id_params =
      Repo.all(q)
      |> Enum.map(fn t -> t.symbol end)
      |> Enum.filter(&(!is_nil(&1)))
      |> Enum.filter(&(&1 != "BLXR"))
      |> Enum.filter(&(&1 != "DFN"))
      |> Enum.filter(&(&1 != "GLM"))
      |> Enum.filter(&(&1 != "GNT"))
      |> Enum.join(",")

    convert_params = "convert_id=2781&"

    aux_params = aux |> Enum.join(",")

    query = "symbol=" <> id_params <> "&" <> convert_params <> "aux=#{aux_params}"
    URI.encode("#{base_url()}/v1/cryptocurrency/quotes/latest?#{query}")
  end
end
