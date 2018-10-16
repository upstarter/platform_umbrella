defmodule Platform.Repo.Migrations.CreateProviders do
  use Ecto.Migration

  def change do
    create table(:providers) do
      add(:auth_account_id, references(:auth_accounts))
      add(:name, :string, null: false)
      add(:email, :string)
      add(:description, :text)

      timestamps()
    end

    create(unique_index(:providers, [:auth_account_id, :name]))
    create(unique_index(:providers, [:email]))
  end
end
