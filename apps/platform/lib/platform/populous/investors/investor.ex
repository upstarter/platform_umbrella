defmodule Platform.Investors.Investor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "investors" do
    field(:avatar_url, :string)
    field(:email, :string)
    field(:first_name, :string)
    field(:last_name, :string)

    timestamps()
  end

  @doc false
  def changeset(investor, attrs) do
    investor
    |> cast(attrs, [:name, :email, :avatar_url])
    |> validate_required([:name, :email, :avatar_url])
  end
end
