defmodule Platform.Repo.Migrations.AddUserPortfolioIdToPortfoliosTokens do
  use Ecto.Migration

  def change do
    alter table(:portfolios_tokens) do
      add(:user_id, references(:users, on_delete: :delete_all), null: false)
    end

    drop(index(:portfolios_tokens, [:portfolio_id, :token_id]))
    create(unique_index(:portfolios_tokens, [:user_id, :portfolio_id, :token_id]))
  end
end
