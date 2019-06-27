defmodule Platform.Repo.Migrations.CreateGroupings do
  use Ecto.Migration

  def change do
    create table(:groupings) do
      add(:member_id, :integer, null: false)
      add(:member_type, :string, null: false)
      add(:group_id, :integer, null: false)
      add(:group_type, :string, null: false)

      timestamps()
    end
  end
end
