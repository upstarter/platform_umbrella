defmodule Platform.Repo.Migrations.CreateProvidersPortfolios do
  use Ecto.Migration

  def change do
    create table(:providers_portfolios) do
      add(:portfolio_id, references(:portfolios))
      add(:provider_id, references(:providers))

      timestamps()
    end

    create(unique_index(:providers_portfolios, [:portfolio_id, :provider_id]))
  end
end
