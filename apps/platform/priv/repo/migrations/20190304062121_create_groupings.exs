defmodule Platform.Repo.Migrations.CreateGroupings do
  use Ecto.Migration

  def change do
    create table(:groupings) do
      add :member_id, :integer
      add :member_type, :string
      add :group_id, :integer
      add :group_type, :string

      timestamps()
    end

  end
end
