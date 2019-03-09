defmodule Platform.Taggings.Tagging do
  use Ecto.Schema
  import Ecto.Changeset


  schema "taggings" do
    field :tagged_id, :integer
    field :topic_id, :integer

    timestamps()
  end

  @doc false
  def changeset(tagging, attrs) do
    tagging
    |> cast(attrs, [:tagged_id, :topic_id])
    |> validate_required([:tagged_id, :topic_id])
  end
end
