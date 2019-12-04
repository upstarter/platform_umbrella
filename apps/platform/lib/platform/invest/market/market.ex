defmodule Platform.Market do
  @moduledoc """
  Context for data related to the cryptocurrency market.
  """

  import Ecto.Query

  alias Platform.{ExchangeRates, Repo}
  alias Platform.ExchangeRates.Token
  alias Platform.Market.DailyMarketHistory

  def init() do
    tokens = Repo.all(from(t in Token, limit: 20))

    Enum.each(tokens, fn t ->
      send(Platform.Market.History.Cataloger, {:fetch_history, t.symbol, 365})
    end)
  end

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
  @spec fetch_recent_history(binary(), non_neg_integer()) :: [DailyMarketHistory.t()]
  def fetch_recent_history(symbol, days) when days >= 1 do
    day_diff = days * -1

    query =
      from(
        mh in DailyMarketHistory,
        where: mh.symbol == ^symbol,
        where: mh.date > date_add(^Date.utc_today(), ^day_diff, "day"),
        order_by: [desc: mh.date]
      )

    Repo.all(query)
  end

  @doc false
  def bulk_insert_history(records) do
    now = NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)

    records =
      records
      |> Enum.map(fn row ->
        row
        |> Map.put(:inserted_at, now)
        |> Map.put(:updated_at, now)
      end)

    Repo.insert_all(DailyMarketHistory, records,
      on_conflict: :replace_all,
      conflict_target: [:symbol, :date]
    )
  end
end
