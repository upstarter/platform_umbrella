defmodule Platform.Tokens.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    has_many(:tokens_tags, Platform.Tokens.TokensTags)
    has_many(:tokens, through: [:tokens_tags, :token])
    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
