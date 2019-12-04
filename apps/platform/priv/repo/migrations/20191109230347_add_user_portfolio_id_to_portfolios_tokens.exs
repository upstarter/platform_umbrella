defmodule Platform.Repo.Migrations.AddUserPortfolioIdToPortfoliosTokens do
  use Ecto.Migration

  def up do
    alter table(:portfolios_tokens) do
      add(:user_id, references(:users, on_delete: :delete_all), null: false)
      remove_if_exists(:portfolio_id, :integer)
      add(:portfolio_id, references(:user_portfolios), null: false)
    end

    create(unique_index(:portfolios_tokens, [:user_id, :portfolio_id, :token_id]))
  end

  def down do
    alter table(:portfolios_tokens) do
      remove(:user_id, references(:users, on_delete: :delete_all), null: false)
      remove(:portfolio_id, references(:user_portfolios), null: false)
    end

    drop(unique_index(:portfolios_tokens, [:user_id, :portfolio_id, :token_id]))
  end
end
