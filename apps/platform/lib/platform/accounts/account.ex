defmodule Platform.Account do
  @moduledoc """

    used by backoffice too

  """

  alias Platform.Account

  def register(params) do
    Ecto.Multi.new()
    |> Platform.Accounts.Registration.create(params)
    |> Platform.Repo.transaction()
    |> case do
      {:ok, %{user: user}} ->
        {:ok, user}

      # matches when reg validation fails
      {:error, :registration, changeset, _changes_so_far} ->
        # to be used on form again
        {:error, changeset}

      # shared schema magic
      # matches when user or credential failed op
      # registration_changeset = successful changes so far
      {:error, _failed_op, changeset, %{registration: registration_changeset}} ->
        registration_changeset = %{
          registration_changeset
          | errors: changeset.errors,
            action: changeset.action
        }

        {:error, registration_changeset}
    end
  end

  # schema "auth_accounts" do
  #   field(:email, :string)
  #   field(:password_hash, :string)
  #   field(:password, :string, virtual: true)
  #
  #   timestamps()
  # end

  # def build(params) do
  #   changeset(%Account{}, params)
  # end

  # def changeset(account, params \\ %{}) do
  #   IO.inspect(account)
  #
  #   cast(account, params, ~w(email password))
  #   |> validate_required([:email, :password])
  #   |> validate_format(:email, ~r/.*@.*/)
  #   |> validate_length(:password, min: 6, max: 255)
  #   |> unique_constraint(:email)
  #   |> put_password_hash()
  # end
  #
  # defp put_password_hash(%{changes: %{password: password}} = changeset) do
  #   put_change(changeset, :password_hash, Comeonin.Argon2.hashpwsalt(password))
  # end
  #
  # defp put_password_hash(%{changes: %{}} = changeset), do: changeset
end
