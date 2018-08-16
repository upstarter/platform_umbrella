defmodule Platform.Repo.Migrations.CreateProviders do
  use Ecto.Migration

  def change do
    create table(:providers) do
      add :user_id, :integer
      add :name, :string
      add :email, :string
      add :desc, :text

      timestamps()
    end
    create(unique_index(:providers, [:user_id, :name]))
    create(unique_index(:providers, [:email]))
  end
end
