defmodule Platform.Repo.Migrations.CreateInvestors do
  use Ecto.Migration

  def change do
    create table(:investors) do
      add :name, :string
      add :email, :string
      add :avatar_url, :string

      timestamps()
    end

  end
end
