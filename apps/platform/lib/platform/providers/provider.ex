defmodule Platform.Providers.Provider do
  use Ecto.Schema
  import Ecto.Changeset


  schema "providers" do
    field :desc, :string
    field :name, :string
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(provider, attrs) do
    provider
    |> cast(attrs, [:user_id, :name, :desc])
    |> validate_required([:user_id, :name, :desc])
  end
end
