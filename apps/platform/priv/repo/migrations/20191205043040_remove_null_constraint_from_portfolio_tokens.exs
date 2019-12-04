defmodule Platform.Repo.Migrations.RemoveNullConstraintFromPortfolioTokens do
  use Ecto.Migration

  def up do
    alter table(:portfolios_tokens) do
      modify(:portfolio_id, :integer, null: true)
    end
  end

  def down do
    alter table(:portfolios_tokens) do
      modify(:portfolio_id, :integer, null: false)
    end
  end
end
