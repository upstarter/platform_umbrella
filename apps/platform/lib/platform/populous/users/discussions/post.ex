defmodule Platform.Users.Discussions.Post do
  use Ecto.Schema
  use Arbor.Tree, foreign_key_type: :integer

  import Ecto.Query
  import Ecto.Changeset
  alias Platform.Repo
  alias Platform.Users.Discussions.Thread
  alias Platform.Users.User

  schema "posts" do
    field(:type, :string)
    field(:title, :string)
    field(:description, :string)
    field(:body, :string)
    field(:active, :boolean, default: false)
    field(:status, :string)
    field(:is_public, :boolean, default: false)
    field(:cached_votes_for_total, :integer)
    belongs_to(:thread, Thread, foreign_key: :thread_id, on_replace: :nilify)
    belongs_to(:user, User)
    belongs_to(:parent, __MODULE__)
    timestamps()
  end

  def user_name(user) do
    user.nickname
  end

  def list_posts(params) do
    IO.inspect(['parms page', params])
    page = String.to_integer(params["page"])
    per_page = String.to_integer(params["per_page"])

    offset = if page > 1, do: (page - 1) * per_page, else: 0

    q = from(p in __MODULE__, limit: ^per_page, offset: ^offset)

    q
    |> Repo.all()
    |> Repo.preload(:user)
  end

  @fields ~w(title description body type status active user_id thread_id parent_id is_public)a
  @required_fields ~w(body type status active user_id thread_id parent_id is_public)a
  @derive {Jason.Encoder, only: [:title, :description, :body, :user_id]}

  def create_for_user(attrs) do
    IO.inspect(['create post', attrs])

    attrs =
      Map.merge(attrs, %{
        "type" => "Users.Discussions.Post",
        "status" => "initial",
        "active" => true,
        "is_public" => true
      })

    changeset = __MODULE__.changeset(%__MODULE__{}, attrs)
    IO.inspect(['create post for user', attrs, changeset])

    {:ok, prop} =
      changeset
      |> Repo.insert()

    prop = Platform.Repo.preload(prop, :user)

    IO.inspect([prop])
    {:ok, prop}
  end

  def validate(%Ecto.Changeset{} = changeset) do
    changeset
    |> validate_required(@required_fields)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, @fields)
    |> validate_required(@required_fields)
    |> foreign_key_constraint(:thread_id)
    |> validate_length(:title, min: 1, max: 255)
  end
end
