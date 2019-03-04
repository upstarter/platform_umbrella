defmodule Platform.Analysts.Analyst do
  use Ecto.Schema
  import Ecto.Changeset


  schema "analysts" do
    field :avatar_url, :string
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(analyst, attrs) do
    analyst
    |> cast(attrs, [:name, :email, :avatar_url])
    |> validate_required([:name, :email, :avatar_url])
  end
end
