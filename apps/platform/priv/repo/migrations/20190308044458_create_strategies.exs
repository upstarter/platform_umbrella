defmodule Platform.Repo.Migrations.CreateStrategies do
  use Ecto.Migration

  def change do
    create table(:strategies) do
      add(:name, :string, null: false)
      add(:short_desc, :string, null: false)
      add(:long_desc, :text)
      add(:type, :string, null: false)
      add(:tagging_id, references(:taggings))

      timestamps()
    end
  end
end
