defmodule Platform.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :auth_id, :integer
    field :email, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :auth_id])
    |> validate_required([:email, :auth_id])
  end
end
