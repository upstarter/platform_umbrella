defmodule Platform.Repo.Migrations.CreateAnalysts do
  use Ecto.Migration

  def change do
    create table(:analysts) do
      add :name, :string
      add :email, :string
      add :avatar_url, :string

      timestamps()
    end

  end
end
