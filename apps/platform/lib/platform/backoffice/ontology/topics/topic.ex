# defmodule Platform.Topics.Topic.TitleSlug do
#   use EctoAutoslugField.Slug, from: :name, to: :slug
# end

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
  alias Platform.Users.Discussions.Thread
  alias Platform.Tokens.Token
  alias Platform.Topics.Topic
  # alias Topic.TitleSlug

  # @timestamps_opts [type: Timex.Ecto.DateTime]
  @primary_key {:id, :binary_id, autogenerate: true, read_after_write: true}

  @derive {Jason.Encoder, only: [:id, :name, :description, :weight, :parent_id, :slug]}
  schema "topics" do
    field(:description, :string)
    field(:name, :string)
    field(:weight, :integer)
    field(:parent_id, :integer)
    # field(:slug, TitleSlug.Type)
    field(:slug, :string)

    many_to_many(:users, User, join_through: Platform.Users.UsersTopics)
    many_to_many(:tokens, Token, join_through: Platform.Topics.TopicsTokens)
    many_to_many(:threads, Thread, join_through: Platform.Users.Discussions.TopicsThreads)
    timestamps()
  end

  def insert_topics_tokens(topic_id, tokens) do
    # token_ids = Enum.map(tokens, fn token -> token.id end)

    topic_tokens = []
    topics = []

    for token <- Enum.zip(tokens, 194..(194 + Enum.count(tokens))) do
      {token, num} = token

      topics = [
        topics
        | %{
            id: num,
            name: token.name,
            description: token.description,
            parent_id: topic_id,
            inserted_at: Timex.now(),
            updated_at: Timex.now()
          }
      ]

      topic_tokens = [
        topic_tokens
        | %{
            topic_id: topic_id,
            token_id: token.id,
            inserted_at: Timex.now(),
            updated_at: Timex.now()
          }
      ]
    end

    {num_topics, topics} = Platform.Repo.insert_all("topics", topics)

    {num_tokens, topics_tokens} = Platform.Repo.insert_all("topics_tokens", topic_tokens)

    if num_topics > 0 and num_tokens > 0 do
      {:ok, topics, topics_tokens}
    else
      {:error, "topics and tokens not inserted"}
    end
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
