defmodule Platform.Repo.Migrations.AddProvidersTable do
  use Ecto.Migration

  def change do
    create table(:providers) do
      add :full_name, :string
      add :email, :string

      timestamps()
    end

    create(unique_index(:providers, [:email]))
  end
end
