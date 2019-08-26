defmodule Platform.Repo.Migrations.CreateProposals do
  use Ecto.Migration

  def change do
    create table(:proposals) do
      add(:type, :string, null: false)
      add(:title, :string, null: false)
      add(:description, :string)
      add(:active, :boolean, default: false, null: false)
      add(:is_public, :boolean, default: false, null: false)
      add(:status, :string)
      add(:user_id, :integer, null: false)
      add(:cached_votes_for_total, :integer)

      timestamps()
    end
  end
end
