defmodule Platform.Accounts.Account do
  @moduledoc """

  User's can have many accounts of differing types ["basic", "magi", "wizard", "sage", "king"]
  User's can have many accounts in different statuses ["initial", "pending_xyz"]

  """

  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Accounts.Account

  schema "accounts" do
    field(:type, :string)
    field(:active, :boolean, default: false)
    field(:status, :string)

    belongs_to(:user, Platform.Users.User)
    timestamps()
  end

  def register(params) do
    Ecto.Multi.new()
    |> Platform.Accounts.Registration.create(params)
    |> Platform.Repo.transaction()
    |> case do
      {:ok, %{user: user}} ->
        user = user |> Platform.Repo.preload(:accounts)
        {:ok, List.last(user.accounts)}

      # matches when reg validation fails
      {:error, :registration, changeset, _changes_so_far} ->
        # to be used on form again
        {:error, changeset}

      # shared schema magic
      # matches when user, user_topics or credential failed op
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

  def changeset(account, params) do
    account
    |> cast(params, [:user_id])
    |> validate_required([:user_id])
  end
end
