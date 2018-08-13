defmodule Platform.Repo.Migrations.CreateProviders do
  use Ecto.Migration

  def change do
    create table(:providers) do
      add :user_id, :integer

      timestamps()
    end

  end
end
