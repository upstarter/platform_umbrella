defmodule Platform.Credential do
  use Ecto.Schema
  import Ecto.Changeset

  schema "credentials" do
    field(:source, :string)
    field(:token, :string)

    field(:password, :string, virtual: true)

    belongs_to(:user, {Platform.User, "users"})
    timestamps()
  end

  def changeset(%Credential{} = credential, params \\ %{}) do
    credential
    |> cast(params, [:password])
    |> validate()
    |> unique_constraint([:user_id, :source])
    |> encrypt_password()
  end

  def validate(%Ecto.Changeset{data: %{source: "password"}} = changeset) do
    validate_password(changeset)
  end

  def validate_password(%Ecto.Changeset{} = changeset) do
    changeset
    |> validate_required([:password])
    |> validate_confirmation(:password, message: "does not match password", required: true)
    |> validate_length(:password, min: 8, max: 40)
  end

  @doc false
  def changeset(credential, attrs) do
    credential
    |> cast(attrs, [:source, :token, :user_id])
    |> validate_required([:source, :token, :user_id])
  end
end
