defmodule Platform.Repo.Migrations.CreatePortfolios do
  use Ecto.Migration

  def change do
    create table(:portfolios) do
      add(:name, :string, null: false)
      add(:description, :text)

      timestamps()
    end
  end
end
