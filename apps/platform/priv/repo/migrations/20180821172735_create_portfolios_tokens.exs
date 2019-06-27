defmodule Platform.Repo.Migrations.CreatePortfoliosTokens do
  use Ecto.Migration

  def change do
    create table(:portfolios_tokens) do
      add(:portfolio_id, references(:portfolios), null: false)
      add(:token_id, references(:tokens), null: false)
      add(:weight, :integer, default: 0)
      timestamps()
    end

    create(unique_index(:portfolios_tokens, [:portfolio_id, :token_id]))
  end
end
