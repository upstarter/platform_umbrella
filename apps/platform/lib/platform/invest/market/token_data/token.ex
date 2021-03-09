defmodule Platform.Market.TokenData.Token do
  @moduledoc """
  Data container for modeling an exchange rate for a currency/token.
  """

  @typedoc """
  Represents an exchange rate for a given token.

   * `:btc_price` - The Bitcoin value of the currency
   * `:id` - ID of a currency
   * `:last_updated` - Timestamp of when the value was last updated
   * `:market_cap_usd` - Market capitalization of the currency
   * `:name` - Human-readable name of a ticker
   * `:symbol` - Trading symbol used to represent a currency
   * `:usd_price` - The USD value of the currency
   * `:volume_24h_usd` - The volume from the last 24 hours in USD
  """

  use Ecto.Schema
  @derive Jason.Encoder
  @primary_key {:id, :integer, autogenerate: false}
  embedded_schema do
    field(:btc_price, :decimal)
    field(:usd_price, :decimal)
    field(:name, :string)
    field(:symbol, :string)
    field(:last_updated, :utc_datetime)
    field(:market_cap_usd, :decimal)
    field(:market_cap_btc, :decimal)
    field(:circulating_supply, :decimal)
    field(:total_supply, :decimal)
    field(:max_supply, :decimal)
    field(:platform_id, :string)
    field(:platform_name, :string)
    field(:percent_change_1h, :decimal)
    field(:percent_change_24h, :decimal)
    field(:percent_change_7d, :decimal)
    field(:percent_change_30d, :decimal)
    field(:percent_change_60d, :decimal)
    field(:percent_change_90d, :decimal)
    field(:volume_24h, :decimal)
    field(:volume_7d, :decimal)
    field(:volume_30d, :decimal)
  end

  @type t :: %__MODULE__{
          id: Integer.t(),
          btc_price: Decimal.t(),
          usd_price: Decimal.t(),
          name: String.t(),
          symbol: Strint.t(),
          last_updated: DateTime.t(),
          market_cap_usd: Decimal.t(),
          market_cap_btc: Decimal.t(),
          circulating_supply: Decimal.t(),
          total_supply: Decimal.t(),
          max_supply: Decimal.t(),
          platform_id: String.t(),
          platform_name: String.t(),
          percent_change_1h: Decimal.t(),
          percent_change_24h: Decimal.t(),
          percent_change_7d: Decimal.t(),
          percent_change_30d: Decimal.t(),
          percent_change_60d: Decimal.t(),
          percent_change_90d: Decimal.t(),
          volume_24h: Decimal.t(),
          volume_7d: Decimal.t(),
          volume_30d: Decimal.t()
        }
end
