defmodule Platform.Repo.Migrations.CreateSystems do
  use Ecto.Migration

  def change do
    create table(:systems) do
      add(:name, :string, null: false)
      add(:description, :text)
      add(:short_desc, :string)

      timestamps()
    end
  end
end
