defmodule Platform.Market.History.Source do
  @moduledoc """
  Interface for a source that allows for fetching of market history.
  """

  @typedoc """
  Record of market values for a specific date.
  """
  @type record :: %{
          symbol: String.t(),
          close: Decimal.t(),
          date: Date.t(),
          open: Decimal.t(),
          high: Decimal.t(),
          low: Decimal.t(),
          volumefrom: Decimal.t(),
          volumeto: Decimal.t()
        }

  @doc """
  Fetch history for a specified amount of days in the past.
  """
  @callback fetch_history(previous_days :: non_neg_integer()) :: {:ok, [record()]} | :error
end
