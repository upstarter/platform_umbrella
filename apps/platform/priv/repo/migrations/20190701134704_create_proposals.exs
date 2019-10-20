defmodule Platform.Repo.Migrations.CreateProposals do
  use Ecto.Migration

  def change do
    create table(:proposals) do
      add(:type, :string, null: false)
      add(:title, :string, null: false)
      add(:description, :string)
      add(:active, :boolean, default: false, null: false)
      add(:is_public, :boolean, default: false, null: false)
      add(:station, :string, null: false)
      add(:status, :string)
      add(:user_id, references(:users), null: false, on_delete: :delete_all)
      add(:cached_votes_for_total, :integer)

      timestamps()
    end
  end
end
