defmodule Platform.Topics.Topic do
  @moduledoc """

    topics on the platform

  """

  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Providers.Provider
  alias Platform.Tokens.Token

  use EctoMaterializedPath

  schema "topics" do
    field(:description, :string)
    field(:name, :string)
    field(:path, EctoMaterializedPath.Path, default: [])

    many_to_many(:providers, Provider, join_through: "providers_topics")
    many_to_many(:tokens, Token, join_through: "topics_tokens")
    timestamps()
  end

  @doc false
  def changeset(topic, attrs) do
    topic
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
