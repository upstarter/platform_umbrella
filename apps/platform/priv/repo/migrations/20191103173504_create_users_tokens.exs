defmodule Platform.Repo.Migrations.CreateUsersTokens do
  use Ecto.Migration

  def change do
    create table(:users_tokens) do
      add(:token_id, references(:tokens, on_delete: :delete_all), null: false)
      add(:user_id, references(:users, on_delete: :delete_all), null: false)

      timestamps()
    end

    create(unique_index(:users_tokens, [:token_id, :user_id]))
  end
end
