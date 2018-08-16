defmodule Platform.Repo.Migrations.CreateTopics do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add :name, :string
      add :short_desc, :string
      add :long_desc, :text

      timestamps()
    end

  end
end
