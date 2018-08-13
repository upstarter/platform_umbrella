defmodule Platform.Tokens.Token do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tokens" do
    field :img_url, :string
    field :name, :string
    field :short_desc, :string
    field :site, :string
    field :ticker, :string

    timestamps()
  end

  @doc false
  def changeset(token, attrs) do
    token
    |> cast(attrs, [:ticker, :name, :site, :short_desc, :img_url])
    |> validate_required([:ticker, :name, :site, :short_desc, :img_url])
  end
end
