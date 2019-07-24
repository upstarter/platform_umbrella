defmodule Platform.Repo.Migrations.CreateUsersTopics do
  use Ecto.Migration

  def change do
    create table(:users_topics, primary_key: false) do
      add(:topic_id, references(:topics, on_delete: :delete_all), null: false)
      add(:user_id, references(:users, on_delete: :delete_all), null: false)

      timestamps()
    end

    create(unique_index(:users_topics, [:topic_id, :user_id]))
  end
end
