defmodule Platform.Market.TokenCache.Source do
  @moduledoc """
  Behaviour for fetching token data from external sources.
  """

  alias Platform.Market.TokenCache.CacheToken

  @doc """
  Callback for fetching an exchange rate for currencies/tokens.
  """
  @callback fetch_token_data :: {:ok, [Token.t()]} | {:error, any}
end
