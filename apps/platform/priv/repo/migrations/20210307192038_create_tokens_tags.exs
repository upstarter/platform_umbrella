defmodule Platform.Repo.Migrations.CreateTokensTags do
  use Ecto.Migration

  def change do
    create table(:tokens_tags) do
      add :token_id, references(:tokens, on_delete: :nothing)
      add :tag_id, references(:tags, on_delete: :nothing)

      timestamps()
    end

    create index(:tokens_tags, [:token_id])
    create index(:tokens_tags, [:tag_id])
  end
end
