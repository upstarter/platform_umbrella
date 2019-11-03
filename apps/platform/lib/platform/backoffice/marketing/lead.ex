defmodule Platform.Marketing.Lead do
  @moduledoc """

    the marketing context

  """

  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Marketing.Lead

  @derive {Jason.Encoder, only: [:email]}

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
