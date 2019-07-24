defmodule Platform.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add(:user_id, references(:users), null: false)
      add(:type, :string, default: "basic", null: false)
      add(:status, :string, default: "registered", null: false)
      add(:active, :boolean, default: false, null: false)

      timestamps()
    end
  end
end
