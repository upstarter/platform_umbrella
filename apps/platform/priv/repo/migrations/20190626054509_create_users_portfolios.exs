defmodule Platform.Repo.Migrations.CreateUserPortfolios do
  use Ecto.Migration

  def change do
    create table(:user_portfolios) do
      add(:portfolio_id, references(:portfolios, on_delete: :delete_all), null: false)
      add(:user_id, references(:users, on_delete: :delete_all), null: false)

      timestamps()
    end

    create(unique_index(:user_portfolios, [:portfolio_id, :user_id]))
  end
end
