defmodule Platform.Repo.Migrations.CreateTopicsTokens do
  use Ecto.Migration

  def change do
    create table(:topics_tokens) do
      add(:topic_id, references(:topics), null: false)
      add(:token_id, references(:tokens), null: false)
      timestamps()
    end

    create(unique_index(:topics_tokens, [:topic_id, :token_id]))
  end
end
