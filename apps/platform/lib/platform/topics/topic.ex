defmodule Platform.Topics.Topic.TitleSlug do
  use EctoAutoslugField.Slug, from: :name, to: :slug
end

defmodule Platform.Topics.Topic do
  @moduledoc """
    topics on the platform
  """

  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Providers.Provider
  alias Platform.Tokens.Token
  alias Platform.Topics.Topic.TitleSlug
  use EctoMaterializedPath

  schema "topics" do
    field(:description, :string)
    field(:name, :string)
    field(:weight, :integer)
    field(:path, EctoMaterializedPath.Path, default: [])
    field(:slug, TitleSlug.Type)
    #
    many_to_many(:providers, Provider, join_through: "providers_topics")
    many_to_many(:tokens, Token, join_through: "topics_tokens")
    timestamps()
  end

  @doc false
  def changeset(topic, attrs) do
    topic
    |> cast(attrs, [:name, :description, :weight])
    |> validate_required([:name, :description])
    |> unique_constraint(:name, name: :topics_name_index)

    # |> TitleSlug.maybe_generate_slug()

    # |> TitleSlug.unique_constraint()
  end
end
