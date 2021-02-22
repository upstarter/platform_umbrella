defmodule Platform.Topics.TopicsTokens do
  use Ecto.Schema
  import Ecto.Changeset

  schema "topics_tokens" do
    belongs_to(:topic, Platform.Topics.Topic)
    belongs_to(:token, Platform.Tokens.Token)

    timestamps()
  end

  @doc false
  def changeset(user_token, attrs) do
    user_token
    |> cast(attrs, [:topic_id, :token_id])
    |> validate_required([:topic_id, :token_id])
  end
end
