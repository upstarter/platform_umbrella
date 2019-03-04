defmodule Platform.Repo.Migrations.CreateTopics do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add(:name, :string, null: false)
      add(:description, :text, null: false)
      add(:slug, :string)
      add(:weight, :integer, null: false, default: 100)
      add(:path, {:array, :integer}, null: false)

      timestamps()
    end

    create(unique_index(:topics, :name))
  end
end
