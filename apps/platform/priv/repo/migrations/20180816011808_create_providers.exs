defmodule Platform.Repo.Migrations.CreateProviders do
  use Ecto.Migration

  def change do
    create table(:providers) do
      add(:user_id, references(:users))
      add(:name, :string)
      add(:email, :string)
      add(:short_desc, :string)

      timestamps()
    end

    create(unique_index(:providers, [:user_id, :name]))
    create(unique_index(:providers, [:email]))
  end
end
