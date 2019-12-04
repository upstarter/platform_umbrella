defmodule Platform.Market.History.Source.CryptoCompare do
  @moduledoc """
  Adapter for fetching market history from https://cryptocompare.com.

  The history is fetched for the coin symbol parameter.

  """

  alias Platform.Market.History.Source
  alias HTTPoison.Response

  @behaviour Source

  @typep unix_timestamp :: non_neg_integer()

  @impl Source
  def fetch_history(symbol, previous_days) do
    url = history_url(symbol, previous_days)
    headers = [{"Content-Type", "application/json"}]

    case HTTPoison.get(url, headers) do
      {:ok, %Response{body: body, status_code: 200}} ->
        {:ok, format_data(symbol, body)}

      _ ->
        :error
    end
  end

  @spec base_url :: String.t()
  defp base_url do
    configured_url = Application.get_env(:platform, __MODULE__, [])[:base_url]
    configured_url || "https://min-api.cryptocompare.com"
  end

  @spec date(unix_timestamp()) :: Date.t()
  defp date(unix_timestamp) do
    unix_timestamp
    |> DateTime.from_unix!()
    |> DateTime.to_date()
  end

  @spec format_data(String.t(), String.t()) :: [Source.record()]
  defp format_data(symbol, data) do
    json = Jason.decode!(data)

    for item <- json["Data"] do
      %{
        symbol: symbol,
        close: Decimal.cast(item["close"]),
        date: date(item["time"]),
        open: Decimal.cast(item["open"]),
        high: Decimal.cast(item["high"]),
        low: Decimal.cast(item["low"]),
        volumefrom: Decimal.cast(item["volumefrom"]),
        volumeto: Decimal.cast(item["volumeto"])
      }
    end
  end

  @spec history_url(string(), non_neg_integer()) :: String.t()
  defp history_url(symbol, previous_days) do
    query_params = %{
      "fsym" => symbol,
      "limit" => previous_days,
      "tsym" => "USD"
    }

    "#{base_url()}/data/histoday?#{URI.encode_query(query_params)}"
  end
end
