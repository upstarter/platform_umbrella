defmodule Platform.Repo.Migrations.CreateTaggings do
  use Ecto.Migration

  def change do
    create table(:taggings) do
      add :tagged_id, :integer
      add :topic_id, :integer

      timestamps()
    end

  end
end
