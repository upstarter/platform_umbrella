# defmodule Platform.Users.DiscussionThread do
#   use Ecto.Schema
#   import Ecto.Changeset
#   import Ecto.Query
#   alias Platform.Repo
#   alias Platform.Users.DiscussionPost
#   alias Platform.Users.Groups.UserGroup
#   alias Platform.Users.Groups.Group
#   alias Platform.Topics.Topic
#   alias Platform.Users.User
#
#   schema("discussions_threads") do
#     field(:title, :string)
#     field(:description, :string)
#     field(:active, :boolean, default: false)
#     field(:status, :string)
#     field(:type, :string)
#     field(:is_public, :boolean, default: false)
#     field(:cached_votes_for_total, :integer)

#     belongs_to(:author, User)
#     belongs_to(:topic, Topic)
#     has_many(:discussion_posts, DiscussionPost, join_through: "discussions_posts")
#     timestamps()
#   end
#
#   def list_discussion_threads(params) do
#     IO.inspect(['parms page', params])
#     page = String.to_integer(params["page"])
#     per_page = String.to_integer(params["per_page"])
#
#     offset = if page > 1, do: (page - 1) * per_page, else: 0
#
#     q = from(p in DiscussionThread, limit: ^per_page, offset: ^offset)
#
#     q
#     |> Repo.all()
#     |> Repo.preload(:author)
#   end
#
#   @fields ~w(title description type status active author_id is_public)a
#   @required_fields ~w(title type status active author_id is_public)a
#
#   def create_for_author(attrs) do
#     attrs =
#       Map.merge(attrs, %{
#         "type" => "Genesis",
#         "station" => "Generalist",
#         "status" => "initial",
#         "is_public" => true
#       })
#
#     changeset = DiscussionThread.changeset(%DiscussionThread{}, attrs)
#     IO.inspect(['create discussion_thread for author', attrs, changeset])
#
#     {:ok, prop} =
#       changeset
#       |> Repo.insert()
#
#     prop = Platform.Repo.preload(prop, :author)
#
#     IO.inspect([prop])
#     {:ok, prop}
#   end
#
#   def validate(%Ecto.Changeset{} = changeset) do
#     changeset
#     |> validate_required([:title, :description, :author_id])
#   end
#
#   @doc false
#   def changeset(discussion_thread, attrs) do
#     discussion_thread
#     |> cast(attrs, @fields)
#     |> validate_required(@required_fields)
#     |> validate_length(:title, min: 1, max: 255)
#   end
# end
