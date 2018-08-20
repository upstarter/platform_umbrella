defmodule Platform.Repo.Migrations.CreateProviderTopics do
  use Ecto.Migration

  def change do
    create table(:providers_topics) do
      add(:topic_id, references(:topics))
      add(:provider_id, references(:providers))
    end

    create(unique_index(:providers_topics, [:topic_id, :provider_id]))
  end
end
