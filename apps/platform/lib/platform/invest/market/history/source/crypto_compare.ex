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
  def fetch_history(token, previous_days) do
    url = history_url(token.symbol, previous_days)
    headers = [{"Content-Type", "application/json"}]

    case HTTPoison.get(url, headers) do
      {:ok, %Response{body: body, status_code: 200}} ->
        {:ok, format_data(token, body)}

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
  defp format_data(token, data) do
    json = Jason.decode!(data)

    for item <- json["Data"] do
      %{
        symbol: token.symbol,
        token_id: token.id,
        close: elem(Decimal.cast(item["close"]), 1),
        date: date(item["time"]),
        open: elem(Decimal.cast(item["open"]), 1),
        high: elem(Decimal.cast(item["high"]), 1),
        low: elem(Decimal.cast(item["low"]), 1),
        volumefrom: elem(Decimal.cast(item["volumefrom"]), 1),
        volumeto: elem(Decimal.cast(item["volumeto"]), 1)
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
