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
  import Ecto.Query
  alias Platform.Repo

  alias Platform.Users.User
  alias Platform.Tokens.Token
  alias Platform.Topics.Topic
  alias Topic.TitleSlug

  @derive {Jason.Encoder, only: [:id, :name, :description, :weight, :parent_id, :slug]}
  schema "topics" do
    field(:description, :string)
    field(:name, :string)
    field(:weight, :integer)
    field(:parent_id, :integer)
    # field(:slug, TitleSlug.Type)
    field(:slug, :string)

    many_to_many(:users, User, join_through: Platform.Users.UsersTopics)
    many_to_many(:tokens, Token, join_through: "topics_tokens")
    timestamps()
  end

  def list_topics(params) do
    IO.inspect(['parms page', params])

    page = String.to_integer(params["page"])
    per_page = String.to_integer(params["per_page"])

    offset = if page > 1, do: (page - 1) * per_page, else: 0

    q = from(p in Topic, limit: ^per_page, offset: ^offset)

    q
    |> Repo.all()
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
