defmodule Platform.Users.UsersTopics do
  use Ecto.Schema
  # @primary_key {:id, :binary_id, autogenerate: true}

  schema "users_topics" do
    belongs_to(:user, Platform.Users.User)
    belongs_to(:topic, Platform.Topics.Topic)
    timestamps()
  end
end
