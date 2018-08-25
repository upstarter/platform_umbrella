defmodule Platform.Repo.Migrations.CreateAuthAccounts do
  use Ecto.Migration

  def change do
    create table(:auth_accounts) do
      add(:name, :string)
      add(:email, :string)
      add(:password_hash, :string)

      timestamps()
    end
  end
end
