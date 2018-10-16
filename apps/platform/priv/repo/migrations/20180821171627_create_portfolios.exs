defmodule Platform.Repo.Migrations.CreatePortfolios do
  use Ecto.Migration

  def change do
    create table(:portfolios) do
      add(:name, :string)
      add(:description, :text)

      timestamps()
    end
  end
end
