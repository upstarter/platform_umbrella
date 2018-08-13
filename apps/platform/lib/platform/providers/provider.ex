defmodule Platform.Marketing.Provider do
  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Marketing.Provider

  @derive {Poison.Encoder, only: [:email]}

  schema "providers" do
    field(:email, :string)

    timestamps()
  end

  @doc false
  def changeset(%Provider{} = provider, attrs) do
    provider
    |> cast(attrs, [:email])
    |> validate_required([:email])
    |> unique_constraint(:email)
  end
end
