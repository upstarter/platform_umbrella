defmodule Platform.Repo.Migrations.CreateStrategies do
  use Ecto.Migration

  def change do
    create table(:strategies) do
      add(:name, :string)
      add(:short_desc, :string)
      add(:long_desc, :text)
      add(:type, :string)
      add(:tagging_id, references(:taggings))
      add(:rating_id, :integer)

      timestamps()
    end
  end
end
