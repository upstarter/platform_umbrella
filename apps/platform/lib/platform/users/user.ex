defmodule Platform.Users.User do
  @moduledoc """

    users on the platform

  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:email, :string)
    field(:name, :string)
    field(:password, :string)

    timestamps()
  end

  defp put_password_hash(changeset) do
    # require IEx; IEx.pry
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))

      _ ->
        changeset
    end
  end

  def registration_changeset(struct, params \\ :empty) do
    struct
    |> changeset(params)
    |> cast(params, ~w(password password_hash), [])
    |> validate_length(:password, min: 6)
    |> put_password_hash()
  end

  @required_fields ~w(name email password)a
  @optional_fields ~w()a
  @doc false
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
