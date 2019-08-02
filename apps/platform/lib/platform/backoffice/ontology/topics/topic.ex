defmodule Platform.Topics.Topic.TitleSlug do
  use EctoAutoslugField.Slug, from: :name, to: :slug
end

defmodule Platform.Topics.Topic do
  @moduledoc """
    topics on the platform
  """

  use Ecto.Schema
  use Arbor.Tree, foreign_key_type: :integer

  import Ecto.Changeset

  alias Platform.Users.User
  alias Platform.Tokens.Token
  alias Platform.Topics.Topic
  alias Topic.TitleSlug

  @derive {Poison.Encoder, only: [:id, :name, :description, :url, :groups, :weight, :slug]}
  schema "topics" do
    field(:description, :string)
    field(:name, :string)
    field(:weight, :integer)
    field(:parent_id, :integer)
    field(:slug, TitleSlug.Type)

    many_to_many(:users, User, join_through: Platform.Users.UsersTopics)
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
