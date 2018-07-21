defmodule Platform.Marketing.Lead do
  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Marketing.Lead

  @derive {Poison.Encoder, only: [:email]}

  schema "leads" do
    field(:email, :string)

    timestamps()
  end

  @doc false
  def changeset(%Lead{} = lead, attrs) do
    lead
    |> cast(attrs, [:email])
    |> validate_required([:email])
    |> unique_constraint(:email)
  end
end
# Platform.Repo.all(Platform.Marketing.Lead)
