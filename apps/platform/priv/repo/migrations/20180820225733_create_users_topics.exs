defmodule Platform.Repo.Migrations.CreateUsersTopics do
  use Ecto.Migration

  def change do
    create table(:users_topics) do
      add(:topic_id, references(:topics), null: false)
      add(:user_id, references(:users), null: false)

      timestamps()
    end

    create(unique_index(:users_topics, [:topic_id, :user_id]))
  end
end
