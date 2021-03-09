defmodule Platform.Tokens.TokenInfo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "token_info" do
    field(:cmc_id, :integer)
    field(:btc_price, :decimal)
    field(:usd_price, :decimal)
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

    belongs_to(:token, Platform.Tokens.Token)
  end

  @doc false
  def changeset(token, attrs) do
    token
    |> cast(attrs, [
      :cmc_id,
      :btc_price,
      :usd_price,
      :last_updated,
      :market_cap_usd,
      :market_cap_btc,
      :circulating_supply,
      :total_supply,
      :max_supply,
      :platform_id,
      :platform_name,
      :percent_change_1h,
      :percent_change_24h,
      :percent_change_7d,
      :percent_change_30d,
      :percent_change_60d,
      :percent_change_90d,
      :volume_24h,
      :volume_7d,
      :volume_30d
    ])
    |> validate_required([
      :cmc_id,
      :usd_price,
      :last_updated,
      :market_cap_usd,
      :circulating_supply,
      :total_supply,
      :max_supply,
      :platform_id,
      :platform_name,
      :percent_change_24h,
      :percent_change_7d,
      :percent_change_30d,
      :volume_24h,
      :volume_7d,
      :volume_30d
    ])
  end
end
