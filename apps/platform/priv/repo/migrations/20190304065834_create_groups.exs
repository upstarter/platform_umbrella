defmodule Platform.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add(:name, :string, null: false)
      add(:short_desc, :string, null: false)
      add(:type, :string)

      timestamps()
    end
  end
end
