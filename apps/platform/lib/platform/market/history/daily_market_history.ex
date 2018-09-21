defmodule Platform.Market.DailyMarketHistory do
  @moduledoc """
  Represents daily market history of selected coin to USD.
  """
  use Ecto.Schema

  schema "daily_market_history" do
    field(:symbol, :string)
    field(:date, :date)
    field(:close, :decimal)
    field(:open, :decimal)
    field(:high, :decimal)
    field(:low, :decimal)
    field(:volumefrom, :decimal)
    field(:volumeto, :decimal)
  end

  @typedoc """
  The recorded values of the selected coin to USD for a single day.

   * `:close` - Closing price in USD.
   * `:date` - The date in UTC.
   * `:open` - Opening price in USD.
   * `:high` - High price for the day in USD.
   * `:low` -  Low price for the day in USD.
   * `:volumefrom` - Volume from for the day in selected coin denomination.
   * `:volumeto` -  Volume to for the day in USD.
  """
  @type t :: %__MODULE__{
          close: Decimal.t(),
          date: Date.t(),
          open: Decimal.t(),
          high: Decimal.t(),
          low: Decimal.t(),
          volumefrom: Decimal.t(),
          volumeto: Decimal.t()
        }
end
