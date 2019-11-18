defmodule Platform.Repo.Migrations.AddUserRole do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add(:title, :string, null: false)

      timestamps()
    end

    create table(:users_roles) do
      add(:user_id, references(:users, on_delete: :delete_all), null: false)
      add(:role_id, references(:roles, on_delete: :delete_all), null: false)
      add(:user_profile_id, references(:user_profiles, on_delete: :delete_all), null: false)

      add(:active, :boolean, default: false, null: false)
      add(:type, :string, default: "basic", null: false)
      add(:status, :string, default: "initial", null: false)

      timestamps()
    end

    create(index(:users_roles, [:user_id, :role_id]))
    create(unique_index(:users_roles, [:user_id, :role_id, :user_profile_id]))
  end
end
