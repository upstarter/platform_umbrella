defmodule Platform.Users.UsersTopics do
  use Ecto.Schema

  schema "users_topics" do
    belongs_to(:user, Platform.Users.User)
    belongs_to(:topic, Platform.Topics.Topic)
    timestamps()
  end
end
