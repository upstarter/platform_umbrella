defmodule Platform.Repo.Migrations.CreateSystems do
  use Ecto.Migration

  def change do
    create table(:systems) do
      add :name, :string
      add :description, :text
      add :short_desc, :string

      timestamps()
    end

  end
end
