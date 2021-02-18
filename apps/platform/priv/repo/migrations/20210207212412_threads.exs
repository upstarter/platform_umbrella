defmodule Platform.Repo.Migrations.Threads do
  use Ecto.Migration

  def change do
    create table(:threads) do
      add(:type, :string, null: false)
      add(:title, :string)
      add(:description, :text)
      add(:body, :text)
      add(:active, :boolean, default: false, null: false)
      add(:is_public, :boolean, default: false, null: false)
      add(:status, :string)
      add(:topic_id, references(:topics, on_delete: :delete_all))
      add(:user_id, references(:users, on_delete: :delete_all), null: false)
      add(:cached_votes_for_total, :integer)

      timestamps()
    end

    create(index(:threads, :topic_id))
    create(index(:threads, :user_id))
    create(index(:threads, :active))
    create(index(:threads, :is_public))
    create(index(:threads, :type))
  end
end
