defmodule Platform.Repo.Migrations.AddInfoToTokens do
  use Ecto.Migration

  def up do
    alter table(:tokens) do
      # remove unused
      remove(:available_supply, :decimal)
      remove(:volume_24h_usd, :decimal)
      remove(:btc_price, :decimal)
      remove(:last_updated, :utc_datetime)
      remove(:market_cap_usd, :decimal)
      remove(:usd_price, :decimal)
      add(:cmc_id, :integer)
      add(:platform_id, :integer)
      add(:platform_name, :string)
    end

    create(index(:tokens, [:cmc_id]))
    create(index(:tokens, [:platform_id]))
  end

  def down do
    drop(index(:tokens, [:cmc_id]))
    drop(index(:tokens, [:platform_id]))

    alter table(:tokens) do
      add(:available_supply, :decimal)
      add(:volume_24h_usd, :decimal)
      add(:btc_price, :decimal)
      add(:last_updated, :utc_datetime)
      add(:market_cap_usd, :decimal)
      add(:usd_price, :decimal)
      remove_if_exists(:cmc_id, :integer)
      remove_if_exists(:platform_id, :integer)
      remove_if_exists(:platform_name, :string)
    end
  end
end
