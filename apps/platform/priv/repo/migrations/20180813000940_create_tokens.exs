defmodule Platform.Repo.Migrations.CreateTokens do
  use Ecto.Migration

  def change do
    create table(:tokens) do
      add(:ticker, :string)
      add(:name, :string)
      add(:site, :string)
      add(:description, :text)
      add(:img_url, :string)

      timestamps()
    end
  end
end
