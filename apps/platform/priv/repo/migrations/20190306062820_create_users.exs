defmodule Platform.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:email, :string, null: false)
      add(:first_name, :string)
      add(:last_name, :string)

      add(:terms_accepted, :boolean)
      add(:confirmation_token, :string)
      add(:confirmation_sent_at, :naive_datetime)
      add(:confirmed_at, :naive_datetime)
      add(:reset_password_token, :string)
      add(:reset_password_sent_at, :naive_datetime)

      timestamps()
    end
  end
end
