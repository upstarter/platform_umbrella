defmodule Platform.Repo.Migrations.CreateProposals do
  use Ecto.Migration

  def change do
    create table(:proposals) do
      add(:type, :string)
      add(:status, :string)
      add(:description, :string)
      add(:active, :boolean, default: false, null: false)
      add(:user_id, :integer)
      add(:cached_votes_for_total, :integer)

      timestamps()
    end
  end
end
