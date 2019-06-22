defmodule Platform.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:auth_account_id, :integer)
    field(:email, :string)

    has_many(:credentials, Platform.Auth.Credential)
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :auth_account_id])
    |> validate_required([:email, :auth_account_id])
  end
end
