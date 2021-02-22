defmodule Platform.Users.Discussions.TopicsThreads do
  use Ecto.Schema
  # @primary_key {:id, :binary_id, autogenerate: true}

  schema "topics_threads" do
    belongs_to(:user, Platform.Users.User)
    belongs_to(:thread, Platform.Users.Discussions.Thread)
    belongs_to(:topic, Platform.Topics.Topic)
    timestamps()
  end
end
