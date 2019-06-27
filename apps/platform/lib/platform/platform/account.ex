defmodule Platform.Platform.Account do
  use Ecto.Schema
  import Ecto.Changeset


  schema "accounts" do
    field :active, :boolean, default: false
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:status, :active])
    |> validate_required([:status, :active])
  end
end
