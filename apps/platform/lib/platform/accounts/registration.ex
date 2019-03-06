defmodule Platform.Accounts.Registration do
  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Registration

  # duplication from other models, but registrar's needs this
  # reflect fields on the form
  embedded_schema do
    field(:email, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:password, :string)
    field(:accept_terms, :boolean, default: false)
  end

  # validate and insert
  def create(%Ecto.Multi{} = multi, params) do
    multi
    |> Ecto.Multi.run(:registration, __MODULE__, :validate_registration, [params])
    |> Ecto.Multi.run(:user, __MODULE__, :insert_user, [params])
    |> Ecto.Multi.run(:credential, __MODULE__, :insert_credential, [params])
  end

  def insert_user(_changes, params) do
    # struct?
    %Platform.User{}
    |> Platform.User.changeset(params)
    |> Platform.Repo.insert()
  end

  # if either step in insertion fails, this never runs
  def insert_credential(%{user: user}, params) do
    user
    |> Ecto.build_assoc(:credential)
    |> Platform.Accounts.Credential.changeset(params)
    # ok or error tuple instructs Ecto.Multi how to proceed
    |> Platform.Repo.insert()
  end

  def validate_registration(_changes, params) do
    changeset = changeset(%__MODULE__{}, params)

    if changeset.valid? do
      {:ok, changeset}
    else
      {:error, apply_action(changeset, :insert)}
    end
  end

  @doc false
  def changeset(registration, params \\ %{}) do
    registration
    |> cast(params, [:first_name, :last_name, :email, :password, :accept_terms])
    |> Platform.User.validate()
    |> Platform.Accounts.Credential.validate()
    |> validate_acceptance(:accept_terms)
  end
end
