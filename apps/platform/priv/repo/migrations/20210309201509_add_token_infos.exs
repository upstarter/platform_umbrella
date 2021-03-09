defmodule Platform.Repo.Migrations.AddTokenInfos do
  use Ecto.Migration

  def change do
    create table(:token_infos) do
      add(:token_id, references(:tokens, on_delete: :delete_all), null: false)
      add(:cmc_id, :integer)
      add(:btc_price, :decimal)
      add(:usd_price, :decimal)
      add(:last_updated, :utc_datetime)
      add(:market_cap_usd, :decimal)
      add(:market_cap_btc, :decimal)
      add(:circulating_supply, :decimal)
      add(:total_supply, :decimal)
      add(:max_supply, :decimal)
      add(:platform_id, :string)
      add(:platform_name, :string)
      add(:percent_change_1h, :decimal)
      add(:percent_change_24h, :decimal)
      add(:percent_change_7d, :decimal)
      add(:percent_change_30d, :decimal)
      add(:percent_change_60d, :decimal)
      add(:percent_change_90d, :decimal)
      add(:volume_24h, :decimal)
      add(:volume_7d, :decimal)
      add(:volume_30d, :decimal)
      timestamps()
    end

    create(index(:token_infos, [:token_id]))
    create(index(:token_infos, [:cmc_id]))
  end
end
