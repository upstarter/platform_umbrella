defmodule Platform.Market do
  @moduledoc """
  Context for data related to the cryptocurrency market.
  """

  import Ecto.Query

  alias Platform.{ExchangeRates, Repo}
  alias Platform.ExchangeRates.Token
  alias Platform.Market.DailyMarketHistory

  @doc """
  Fetch the most recent <days> worth of daily data
  """
  def fetch_daily_history(symbol, day_count) do
    send(Platform.Market.History.Cataloger, {:fetch_history, symbol, day_count})
  end

  @doc """
  Get most recent exchange rate for the given symbol.
  """
  @spec get_exchange_rate(String.t()) :: Token.t() | nil
  def get_exchange_rate(symbol) do
    ExchangeRates.lookup(symbol)
  end

  @doc """
  Retrieves the history for the recent specified amount of days.

  Today's date is included as part of the day count
  """
  @spec fetch_recent_history(non_neg_integer()) :: [DailyMarketHistory.t()]
  def fetch_recent_history(days) when days >= 1 do
    day_diff = days * -1

    query =
      from(
        mh in DailyMarketHistory,
        where: mh.date > date_add(^Date.utc_today(), ^day_diff, "day"),
        order_by: [desc: mh.date]
      )

    Repo.all(query)
  end

  @doc false
  def bulk_insert_history(records) do
    Repo.insert_all(DailyMarketHistory, records,
      on_conflict: :replace_all,
      conflict_target: [:symbol, :date]
    )
  end
end
