defmodule Platform.Strategies.Strategy do
  use Ecto.Schema
  import Ecto.Changeset


  schema "strategies" do
    field :long_desc, :string
    field :name, :string
    field :short_desc, :string
    field :tagging_id, :integer
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(strategy, attrs) do
    strategy
    |> cast(attrs, [:name, :short_desc, :long_desc, :type, :tagging_id])
    |> validate_required([:name, :short_desc, :long_desc, :type, :tagging_id])
  end
end
