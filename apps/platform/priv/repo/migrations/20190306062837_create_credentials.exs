defmodule Platform.Repo.Migrations.CreateCredentials do
  use Ecto.Migration

  def change do
    create table(:credentials) do
      add(:user_id, references("users", on_delete: :delete_all), null: false)

      add(:source, :string, null: false, default: "password")
      add(:token, :string, null: false)

      timestamps()
    end

    create(index(:credentials, [:source, :token]))
    create(unique_index(:credentials, [:user_id, :source]))
  end
end
