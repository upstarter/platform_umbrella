defmodule Platform.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :name, :string
      add :short_desc, :string
      add :type, :string

      timestamps()
    end

  end
end