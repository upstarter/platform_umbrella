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

  @doc false
  def changeset(registration, params \\ %{}) do
    registration
    |> cast(params, [:first_name, :last_name, :email, :password, :accept_terms])
    |> Platform.User.validate()
    |> Platform.Accounts.Credential.validate()
    |> validate_acceptance(:accept_terms)
  end
end
