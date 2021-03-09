defmodule Platform.Market.TokenData.Source do
  @moduledoc """
  Behaviour for fetching token data from external sources.
  """

  alias Platform.Market.TokenData.Token

  @doc """
  Callback for fetching an exchange rate for currencies/tokens.
  """
  @callback fetch_token_data :: {:ok, [Token.t()]} | {:error, any}
end
