defmodule Platform.Repo.Migrations.CreateUserProfiles do
  use Ecto.Migration

  def change do
    create table(:user_profiles) do
      add(:roles, :map, default: %{})

      timestamps()
    end
  end
end
