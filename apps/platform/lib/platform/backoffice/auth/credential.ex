defmodule Platform.Auth.Credential do
  use Ecto.Schema
  import Ecto.Changeset

  alias Platform.Auth.Credential

  schema "credentials" do
    field(:source, :string)
    field(:token, :string)
    field(:password, :string, virtual: true)

    belongs_to(:user, Platform.Users.User)
    timestamps()
  end

  def validate(%Ecto.Changeset{changes: %{password: _pwd}} = changeset) do
    Credential.validate_password(changeset)
  end

  def validate_password(%Ecto.Changeset{} = changeset) do
    changeset
    |> validate_required([:password])
    |> validate_length(:password, min: 8, max: 40)
    |> Credential.encrypt_password()
  end

  def encrypt_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :token, Comeonin.Argon2.hashpwsalt(pass))

      _ ->
        changeset
    end
  end

  def changeset(%Credential{} = credential, params \\ %{}) do
    credential
    |> cast(params, [:password, :token, :user_id])
    |> Credential.validate()
    |> validate_required([:source, :token, :user_id])
    |> unique_constraint(:credentials, ["source", "user_id"])
  end
end
