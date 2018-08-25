defmodule Platform.Auth.Account do
  @moduledoc """

    used by backoffice too

  """

  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Auth
  alias Platform.Auth.Account

  schema "auth_accounts" do
    field(:email, :string)
    field(:password_hash, :string)
    field(:password, :string, virtual: true)

    timestamps()
  end

  def build(params) do
    changeset(%Account{}, params)
  end

  def changeset(account, params \\ %{}) do
    IO.inspect(account)

    cast(account, params, ~w(email password))
    |> validate_required([:email, :password])
    |> validate_format(:email, ~r/.*@.*/)
    |> validate_length(:password, min: 8)
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(%{changes: %{password: password}} = changeset) do
    put_change(changeset, :password_hash, Comeonin.Argon2.hashpwsalt(password))
  end

  defp put_password_hash(%{changes: %{}} = changeset), do: changeset
end
