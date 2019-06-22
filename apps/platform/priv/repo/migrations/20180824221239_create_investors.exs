defmodule Platform.Repo.Migrations.CreateInvestors do
  use Ecto.Migration

  def change do
    create table(:investors) do
      add(:auth_account_id, :integer, null: false)
      add(:name, :string)
      add(:email, :string)
      add(:avatar_url, :string)

      timestamps()
    end

    create(unique_index(:investors, [:auth_account_id, :name]))
    create(unique_index(:investors, [:email]))
  end
end
