defmodule Platform.Repo.Migrations.AddInfoToTokens do
  use Ecto.Migration

  def up do
    alter table(:tokens) do
      # remove unused
      remove(:available_supply, :decimal)
      remove(:volume_24h_usd, :decimal)

      add(:cmc_id, :integer)
      add(:market_cap_usd, :decimal)
      add(:market_cap_btc, :decimal)
      add(:circulating_supply, :decimal)
      add(:last_updated, :utc_datetime)

      add(:total_supply, :decimal)
      add(:max_supply, :decimal)
      add(:platform_id, :integer)
      add(:platform_name, :string)
      add(:percent_change_1h, :decimal)
      add(:percent_change_24h, :decimal)
      add(:percent_change_7d, :decimal)
      add(:percent_change_30d, :decimal)
      add(:volume_1h, :decimal)
      add(:volume_24h, :decimal)
      add(:volume_7d, :decimal)
      add(:volume_30d, :decimal)

      remove_if_exists(:cmc_id, :integer)
      remove_if_exists(:market_cap_usd, :decimal)
      remove_if_exists(:circulating_supply, :decimal)
      remove_if_exists(:last_updated, :utc_datetime)

      remove_if_exists(:total_supply, :decimal)
      remove_if_exists(:max_supply, :decimal)
      remove_if_exists(:platform_id, :integer)
      remove_if_exists(:platform_name, :string)
      remove_if_exists(:percent_change_1h, :decimal)
      remove_if_exists(:percent_change_24h, :decimal)
      remove_if_exists(:percent_change_7d, :decimal)
      remove_if_exists(:percent_change_30d, :decimal)
      remove_if_exists(:volume_1h, :decimal)
      remove_if_exists(:volume_24h, :decimal)
      remove_if_exists(:volume_7d, :decimal)
      remove_if_exists(:volume_30d, :decimal)
    end

    create(index(:tokens, [:cmc_id]))
    create(index(:tokens, [:platform_id]))
  end

  def down do
    alter table(:tokens) do
      add(:available_supply, :decimal)
      add(:volume_24h_usd, :decimal)
      remove_if_exists(:cmc_id, :integer)
      remove_if_exists(:market_cap_usd, :decimal)
      remove_if_exists(:market_cap_btc, :decimal)
      remove_if_exists(:circulating_supply, :decimal)
      remove_if_exists(:total_supply, :decimal)
      remove_if_exists(:max_supply, :decimal)
      remove_if_exists(:platform_id, :integer)
      remove_if_exists(:platform_name, :string)
      remove_if_exists(:percent_change_1h, :decimal)
      remove_if_exists(:percent_change_24h, :decimal)
      remove_if_exists(:percent_change_7d, :decimal)
      remove_if_exists(:percent_change_30d, :decimal)
      remove_if_exists(:volume_1h, :decimal)
      remove_if_exists(:volume_24h, :decimal)
      remove_if_exists(:volume_7d, :decimal)
      remove_if_exists(:volume_30d, :decimal)
    end

    #
    # drop(index(:tokens, [:cmc_id]))
    # drop(index(:tokens, [:platform_id]))
  end
end
