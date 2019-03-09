defmodule Platform.Repo.Migrations.CreateOntologies do
  use Ecto.Migration

  def change do
    create table(:ontologies) do
      add(:subject_id, :integer)
      add(:representation_id, :integer)
      add(:perspective_id, :integer)
      add(:constraint_id, :integer)
      add(:context_id, :integer)
      add(:context_type, :integer)
      add(:class_id, :integer)
      add(:class_type, :string)

      timestamps()
    end
  end
end
