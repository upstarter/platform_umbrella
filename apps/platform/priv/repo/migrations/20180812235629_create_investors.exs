defmodule Platform.Repo.Migrations.CreateInvestors do
  use Ecto.Migration

  def change do
    create table(:investors) do
      add :user_id, :integer

      timestamps()
    end

  end
end
