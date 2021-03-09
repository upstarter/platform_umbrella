defmodule Platform.Repo.Migrations.RemoveUnusedTokenData do
  use Ecto.Migration

  def up do
    alter table(:tokens) do
      remove_if_exists(:available_supply, :decimal)
      remove_if_exists(:volume_24h_usd, :decimal)
      remove_if_exists(:btc_value, :decimal)
      remove_if_exists(:last_updated, :utc_datetime)
      remove_if_exists(:market_cap_usd, :decimal)
      remove_if_exists(:usd_value, :decimal)
    end
  end

  def down do
    alter table(:tokens) do
      add(:available_supply, :decimal)
      add(:volume_24h_usd, :decimal)
      add(:btc_value, :decimal)
      add(:last_updated, :utc_datetime)
      add(:market_cap_usd, :decimal)
      add(:usd_value, :decimal)
    end
  end
end
