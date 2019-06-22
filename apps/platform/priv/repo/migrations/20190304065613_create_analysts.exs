defmodule Platform.Repo.Migrations.CreateAnalysts do
  use Ecto.Migration

  def change do
    create table(:analysts) do
      add(:auth_account_id, :integer)
      add(:name, :string)
      add(:email, :string)
      add(:avatar_url, :string)

      timestamps()
    end

    create(unique_index(:analysts, [:auth_account_id, :name]))
    create(unique_index(:analysts, [:email]))
  end
end
