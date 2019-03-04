defmodule Platform.Groups.Group do
  use Ecto.Schema
  import Ecto.Changeset


  schema "groups" do
    field :name, :string
    field :short_desc, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:name, :short_desc, :type])
    |> validate_required([:name, :short_desc, :type])
  end
end
