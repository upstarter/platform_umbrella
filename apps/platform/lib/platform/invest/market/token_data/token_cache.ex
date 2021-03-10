defmodule Platform.Market.TokenCache do
  @moduledoc """
  Local cache for token token data.

  Token data is updated every 5 minutes.
  """

  use GenServer

  require Logger

  alias Platform.Market.TokenCache.CacheToken

  @interval :timer.minutes(60)
  @table_name :token_data
  @typep milliseconds :: non_neg_integer()

  @impl GenServer
  def handle_info(:update, state) do
    Logger.debug(fn -> "Updating cached token data" end)

    fetch_rates()

    {:noreply, state}
  end

  # Callback for successful fetch
  @impl GenServer
  def handle_info({_ref, {_, {:ok, tokens}}}, state) do
    records =
      for %Token{symbol: symbol} = token <- tokens do
        {symbol, token}
      end

    if store() == :ets do
      :ets.insert(table_name(), records)
    end

    broadcast_event(:exchange_rate)

    {:noreply, state}
  end

  # Callback for errored fetch
  @impl GenServer
  def handle_info({_ref, {failed_attempts, {:error, reason}}}, state) do
    Logger.warn(fn -> "Failed to get token data with reason '#{reason}'." end)
    # fetch_rates(failed_attempts + 1)

    {:noreply, state}
  end

  # Callback that a monitored process has shutdown
  @impl GenServer
  def handle_info({:DOWN, _, :process, _, _}, state) do
    {:noreply, state}
  end

  @impl GenServer
  def init(_) do
    send(self(), :update)
    :timer.send_interval(@interval, :update)

    table_opts = [
      :set,
      :named_table,
      :public,
      read_concurrency: true,
      write_concurrency: true
    ]

    if store() == :ets do
      :ets.new(table_name(), table_opts)
    end

    {:ok, %{}}
  end

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @doc """
  Lists token data for the tracked tickers.
  """
  @spec list :: [Token.t()]
  def list do
    list_from_store(store())
  end

  @doc """
  Returns a specific token data from the tracked tickers by symbol
  """
  @spec lookup(String.t()) :: Token.t() | nil
  def lookup(symbol) do
    if store() == :ets do
      case :ets.lookup(table_name(), symbol) do
        [{_key, token} | _] -> token
        _ -> nil
      end
    end
  end

  @doc false
  @spec table_name() :: atom()
  def table_name, do: @table_name

  @spec broadcast_event(atom()) :: :ok
  defp broadcast_event(event_type) do
    Registry.dispatch(Registry.MarketEvents, event_type, fn entries ->
      for {pid, _registered_val} <- entries do
        send(pid, {:market_event, event_type})
      end
    end)
  end

  @spec config_or_default(string(), term()) :: term()
  defp config_or_default(key, default) do
    Application.get_env(:platform, __MODULE__, [])[key] || default
  end

  @spec token_data_source() :: module()
  defp token_data_source do
    config_or_default(:source, Platform.Market.TokenCache.Source.CoinMarketCap)
  end

  @spec fetch_rates :: Task.t()
  defp fetch_rates(failed_attempts \\ 0) do
    Task.Supervisor.async_nolink(Platform.MarketTaskSupervisor, fn ->
      Process.sleep(delay(failed_attempts))
      {failed_attempts, token_data_source().fetch_token_data()}
    end)
  end

  @spec delay(non_neg_integer()) :: milliseconds()
  defp delay(0), do: 0
  defp delay(1), do: base_backoff()

  defp delay(failed_attempts) do
    # Simulates 2^n
    multiplier = Enum.reduce(2..failed_attempts, 1, fn _, acc -> 2 * acc end)
    multiplier * base_backoff()
  end

  @spec base_backoff :: milliseconds()
  defp base_backoff do
    config_or_default(:base_backoff, 100)
  end

  defp list_from_store(:ets) do
    table_name()
    |> :ets.tab2list()
    |> Enum.map(fn {_, rate} -> rate end)
    |> Enum.sort_by(fn %Token{symbol: symbol} -> symbol end)
  end

  defp list_from_store(_), do: []

  defp store do
    config_or_default(:store, :ets)
  end
end
