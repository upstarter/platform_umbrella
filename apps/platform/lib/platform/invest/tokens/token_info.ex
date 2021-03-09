defmodule Platform.Tokens.TokenInfo do
  use Ecto.Schema
  import Ecto.Changeset

  schema do
    field(id: :integer)
    field(btc_price: :decimal)
    field(usd_price: :decimal)
    field(name: :string)
    field(symbol: :string)
    field(last_updated: :date_time)
    field(market_cap_usd: :decimal)
    field(market_cap_btc: :decimal)
    field(circulating_supply: :decimal)
    field(total_supply: :decimal)
    field(max_supply: :decimal)
    field(platform_id: :string)
    field(platform_name: :string)
    field(percent_change_1h: :decimal)
    field(percent_change_24h: :decimal)
    field(percent_change_7d: :decimal)
    field(percent_change_30d: :decimal)
    field(percent_change_60d: :decimal)
    field(percent_change_90d: :decimal)
    field(volume_24h: :decimal)
    field(volume_7d: :decimal)
    field(volume_30d: :decima)
  end
end
