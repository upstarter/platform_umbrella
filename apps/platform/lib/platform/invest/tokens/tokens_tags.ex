defmodule Platform.Tokens.TokensTags do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tokens_tags" do
    belongs_to(:token, Platform.Tokens.Token)
    belongs_to(:tag, Platform.Tokens.Tag)
    timestamps()
  end

  @doc false
  def changeset(tokens_tags, attrs) do
    tokens_tags
    |> cast(attrs, [:token_id, :tag_id])
    |> validate_required([:token_id, :tag_id])
  end
end
