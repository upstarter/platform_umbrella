defmodule Platform.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:email, :string, null: false)
      add(:first_name, :string)
      add(:last_name, :string)
      add(:nickname, :string)
      add(:phone, :string)
      add(:avatar_url, :string)

      add(:terms_accepted, :boolean)
      add(:confirmation_token, :string)
      add(:confirmation_sent_at, :naive_datetime)
      add(:confirmed_at, :naive_datetime)
      add(:reset_password_token, :string)
      add(:reset_password_sent_at, :naive_datetime)

      add(:sign_in_count, :integer, default: 0)
      add(:last_sign_in_ip, :string)
      add(:last_sign_in_at, :utc_datetime)
      add(:current_sign_in_ip, :string)
      add(:current_sign_in_at, :utc_datetime)

      timestamps()
    end

    create(unique_index(:users, [:email]))
    create(unique_index(:users, [:last_name]))
    create(unique_index(:users, [:nickname]))
  end
end
