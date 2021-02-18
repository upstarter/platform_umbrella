defmodule Platform.Users.Discussions.Thread do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias Platform.Repo
  alias Platform.Users.Discussions.Post
  alias Platform.Users.Groups.UserGroup
  alias Platform.Users.Groups.Group
  alias Platform.Topics.Topic
  alias Platform.Users.User

  schema("threads") do
    field(:type, :string)
    field(:title, :string)
    field(:description, :string)
    field(:body, :string)
    field(:active, :boolean, default: false)
    field(:status, :string)
    field(:is_public, :boolean, default: false)
    field(:cached_votes_for_total, :integer)

    belongs_to(:user, User)
    belongs_to(:topic, Topic)
    has_many(:posts, Post)
    timestamps()
  end

  def list_threads(params) do
    IO.inspect(['parms page', params])
    page = String.to_integer(params["page"])
    per_page = String.to_integer(params["per_page"])

    offset = if page > 1, do: (page - 1) * per_page, else: 0

    # REALLY? this is how to eager load?
    # thread_ids = [1, 2]
    #
    # query =
    #   from(thread in __MODULE__,
    #     inner_lateral_join:
    #       t in fragment(
    #         "SELECT * FROM posts WHERE thread_id = ? ORDER BY inserted_at DESC LIMIT 3",
    #         thread.id
    #       ),
    #     where: thread.id in ^thread_ids,
    #     order_by: [asc: thread.id],
    #     select: %Post{
    #       id: t.id,
    #       title: t.title,
    #       thread_id: t.thread_id,
    #       inserted_at: type(t.inserted_at, :naive_datetime),
    #       updated_at: type(t.updated_at, :naive_datetime)
    #     }
    #   )

    posts_query = from(p in Post, order_by: [desc: :inserted_at], preload: [:user])

    from(t in __MODULE__,
      limit: ^per_page,
      offset: ^offset,
      order_by: [desc: :inserted_at],
      preload: [posts: ^posts_query]
    )
    |> Repo.all()
    |> Repo.preload([:user, :topic])
  end

  @fields ~w(title description body type status active user_id topic_id is_public)a
  @required_fields ~w(title description type status active user_id is_public)a
  @derive {Jason.Encoder, only: [:posts]}
  def create_for_user(attrs) do
    IO.inspect(['create', attrs])

    attrs =
      Map.merge(attrs, %{
        "type" => "Users.Discussions.Thread",
        "status" => "initial",
        "active" => true,
        "is_public" => true
      })

    changeset = __MODULE__.changeset(%__MODULE__{}, attrs)
    IO.inspect(['create discussion thread for user', attrs, changeset])

    {:ok, prop} =
      changeset
      |> Repo.insert()

    prop = prop |> Platform.Repo.preload([:topic, :user, :posts])

    IO.inspect([prop])
    {:ok, prop}
  end

  def validate(%Ecto.Changeset{} = changeset) do
    changeset
    |> validate_required(@required_fields)
  end

  @doc false
  def changeset(thread, attrs) do
    thread
    |> cast(attrs, @fields)
    |> validate_required(@required_fields)
    |> validate_length(:title, min: 1, max: 255)
  end
end
