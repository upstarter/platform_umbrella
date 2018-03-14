defmodule Platform.Repo.Migrations.CreateLeads do
  use Ecto.Migration

  def change do
    create table(:leads) do
      add :full_name, :string
      add :email, :string

      timestamps()
    end

    create(unique_index(:leads, [:email]))
  end
end
