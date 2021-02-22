defmodule Platform.Repo.Migrations.CreateTopicsThreads do
  use Ecto.Migration

  def change do
    create table(:topics_threads) do
      add(:user_id, references(:users, on_delete: :delete_all), null: false)
      add(:thread_id, references(:threads, on_delete: :delete_all), null: false)
      add(:topic_id, references(:topics, on_delete: :delete_all), null: false)

      timestamps()
    end

    create(index(:topics_threads, :user_id))
    create(index(:topics_threads, :thread_id))
    create(index(:topics_threads, :topic_id))
  end
end
