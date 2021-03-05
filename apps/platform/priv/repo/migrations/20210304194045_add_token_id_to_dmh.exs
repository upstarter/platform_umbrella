defmodule Platform.Repo.Migrations.AddTokenIdToDmh do
  use Ecto.Migration

  def up do
    alter table(:daily_market_history) do
      add(:token_id, references(:tokens, on_delete: :delete_all))
      remove_if_exists(:token_id, :integer)
    end

    create(index(:daily_market_history, [:token_id]))
  end

  def down do
    alter table(:daily_market_history) do
      remove(:token_id, references(:tokens, on_delete: :delete_all))
    end

    drop(index(:daily_market_history, [:token_id]))
  end
end
