defmodule Platform.Systems.System do
  use Ecto.Schema
  import Ecto.Changeset


  schema "systems" do
    field :description, :string
    field :name, :string
    field :short_desc, :string

    timestamps()
  end

  @doc false
  def changeset(system, attrs) do
    system
    |> cast(attrs, [:name, :description, :short_desc])
    |> validate_required([:name, :description, :short_desc])
  end
end
