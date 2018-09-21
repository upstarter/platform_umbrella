defmodule Platform.Repo.Migrations.CreateDailyMarketHistory do
  use Ecto.Migration

  def change do
    create table(:daily_market_history) do
      add(:symbol, :string)
      add(:date, :date)
      add(:close, :decimal)
      add(:open, :decimal)
      add(:high, :decimal)
      add(:low, :decimal)
      add(:volumefrom, :decimal)
      add(:volumeto, :decimal)
    end

    create(unique_index(:daily_market_history, [:symbol, :date]))
  end
end
