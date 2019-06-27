defmodule Platform.Repo.Migrations.CreateUserPortfolios do
  use Ecto.Migration

  def change do
    create table(:user_portfolios) do
      add(:portfolio_id, references(:portfolios), null: false)
      add(:user_id, references(:users), null: false)

      timestamps()
    end

    create(unique_index(:user_portfolios, [:portfolio_id, :user_id]))
  end
end
