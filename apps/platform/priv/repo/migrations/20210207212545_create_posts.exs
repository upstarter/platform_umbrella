defmodule Platform.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add(:type, :string, null: false)
      add(:parent_id, :integer)
      add(:title, :string)
      add(:description, :text)
      add(:body, :text)
      add(:active, :boolean, default: false, null: false)
      add(:is_public, :boolean, default: false, null: false)
      add(:status, :string)
      add(:user_id, references(:users, on_delete: :delete_all), null: false)
      add(:thread_id, references(:threads, on_delete: :delete_all), null: false)
      add(:cached_votes_for_total, :integer)

      timestamps()
    end

    create(index(:posts, :user_id))
    create(index(:posts, :thread_id))
    create(index(:posts, :parent_id))
    create(index(:posts, :active))
    create(index(:posts, :is_public))
    create(index(:posts, :type))
  end
end
