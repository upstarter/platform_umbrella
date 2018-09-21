defmodule Platform.ExchangeRates.Source do
  @moduledoc """
  Behaviour for fetching exchange rates from external sources.
  """

  alias Platform.ExchangeRates.Token

  @doc """
  Callback for fetching an exchange rates for currencies/tokens.
  """
  @callback fetch_exchange_rates :: {:ok, [Token.t()]} | {:error, any}
end
