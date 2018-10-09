defmodule Platform.Repo.Migrations.CreateTopics do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add(:name, :string, null: false)
      add(:description, :text)
      add(:path, {:array, :integer}, null: false)

      timestamps()
    end
  end
end
