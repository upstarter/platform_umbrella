# defmodule Platform.Users.DiscussionPost do
#   use Ecto.Schema
#   import Ecto.Changeset
#   alias Platform.Users.DiscussionThread
#   alias Platform.Users.User
#
#   schema "discussions_posts" do
#     field(:body, :text)
#     belongs_to(:discussion_thread, DiscussionThread)
#     belongs_to(:user, User)
#     timestamps()
#   end
#
#   @doc false
#   def changeset(discussion_post, attrs) do
#     discussion_post
#     |> cast(attrs, [:user_id, :discussion_thread_id])
#     |> validate_required([:user_id, :discussion_thread_id])
#   end
# end
