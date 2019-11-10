defmodule Platform.Repo.Migrations.CreateUserGroups do
  use Ecto.Migration

  def change do
    create table(:user_groups) do
      add(:member_id, :integer, null: false)
      add(:member_type, :string, null: false)
      add(:group_id, :integer, null: false)
      add(:group_type, :string, null: false)

      timestamps()
    end
  end
end
