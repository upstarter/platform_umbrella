defmodule Platform.Market.History.Cataloger do
  @moduledoc """
  Fetches the daily market history.

  Market grabs the last <day_count> day's worth of market history for the passed in
  coin. Once that data is fetched, current day's values are
  checked every 60 minutes. Additionally, failed requests to the history
  source will follow exponential backoff `100ms * 2^(n+1)` where `n` is the
  number of failed requests.

  ## Configuration

  The following example shows the configurable values in a sample config.

      config :platform, Platform.Market.History.Cataloger,
        # fetch interval in milliseconds
        history_fetch_interval: :timer.minutes(60),
        # Base backoff in milliseconds for failed requests to history API
        base_backoff: 100

  """

  import Ecto.Query

  use GenServer

  require Logger

  alias Platform.Repo
  alias Platform.Market
  alias Platform.Tokens.Token

  @typep milliseconds :: non_neg_integer()

  @impl GenServer
  def init(:ok) do
    send(self(), :init_fetch_history)
    {:ok, %{}}
  end

  @impl GenServer
  def handle_info(:init_fetch_history, state) do
    # TODO: check how recent, only pull if out of date
    tokens = Repo.all(from(t in Token))

    Enum.each(tokens, fn t ->
      send(__MODULE__, {:fetch_history, t, 365})
    end)

    {:noreply, state}
  end

  @impl GenServer
  def handle_info({:fetch_history, token, day_count}, state) do
    fetch_history(token, day_count)

    {:noreply, state}
  end

  @impl GenServer
  # Record fetch successful.
  def handle_info({_ref, {token, _, _, {:ok, records}}}, state) do
    Market.bulk_insert_history(records)

    # Schedule next check for history
    fetch_after = config_or_default(:history_fetch_interval, :timer.minutes(60))
    Process.send_after(self(), {:fetch_history, token, 1}, fetch_after)

    {:noreply, state}
  end

  # Failed to get records. Try again.
  @impl GenServer
  def handle_info({_ref, {token, day_count, failed_attempts, :error}}, state) do
    Logger.warn(fn ->
      "Failed to fetch market history for #{token.symbol}. #{failed_attempts} failed attempts. Trying again."
    end)

    fetch_history(token, day_count, failed_attempts + 1)

    {:noreply, state}
  end

  # Callback that a monitored process has shutdown.
  @impl GenServer
  def handle_info({:DOWN, _, :process, _, _}, state) do
    {:noreply, state}
  end

  @doc """
  Starts a process to continually fetch market history.
  """
  @spec start_link(term()) :: GenServer.on_start()
  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  @spec base_backoff :: milliseconds()
  defp base_backoff do
    config_or_default(:base_backoff, 100)
  end

  @spec config_or_default(string(), term()) :: term()
  defp config_or_default(key, default) do
    Application.get_env(:platform, __MODULE__, [])[key] || default
  end

  @spec source() :: module()
  defp source do
    config_or_default(:source, Platform.Market.History.Source.CryptoCompare)
  end

  @spec fetch_history(bitstring(), non_neg_integer(), non_neg_integer()) :: Task.t()
  defp fetch_history(token, day_count, failed_attempts \\ 0) do
    Task.Supervisor.async_nolink(Platform.MarketTaskSupervisor, fn ->
      Process.sleep(delay(failed_attempts))
      {token, day_count, failed_attempts, source().fetch_history(token, day_count)}
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
end
