defmodule Platform.Repo.Migrations.CreatePortfolios do
  use Ecto.Migration

  def change do
    create table(:portfolios) do
      add :name, :string
      add :short_desc, :string
      add :long_desc, :text

      timestamps()
    end

  end
end
