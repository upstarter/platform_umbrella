defmodule Platform.Accounts.Account do
  @moduledoc """

    User's can have many accounts

  """

  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Accounts.Account

  schema "accounts" do
    field(:status, :string)
    field(:active, :boolean)

    timestamps()
  end

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

  def validate(%Ecto.Changeset{} = changeset) do
    changeset
    |> validate_required([:status])
  end
end
