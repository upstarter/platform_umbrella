defmodule Platform.Repo.Migrations.CreateTokens do
  use Ecto.Migration

  def change do
    create table(:tokens) do
      add(:symbol, :string, null: false)
      add(:name, :string)
      add(:site, :string)
      add(:description, :text)
      add(:img_url, :string)
      add(:available_supply, :decimal)
      add(:btc_value, :decimal)
      add(:last_updated, :utc_datetime)
      add(:market_cap_usd, :decimal)
      add(:usd_value, :decimal)
      add(:volume_24h_usd, :decimal)

      timestamps()
    end
  end
end
