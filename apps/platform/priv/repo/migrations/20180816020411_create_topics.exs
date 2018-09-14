defmodule Platform.Repo.Migrations.CreateTopics do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add(:name, :string, null: false)
      add(:short_desc, :string)
      add(:long_desc, :text)
      add(:path, {:array, :integer}, null: false)

      timestamps()
    end
  end
end
