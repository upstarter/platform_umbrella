defmodule Platform.Topics.Topic do
  @moduledoc """

    topics on the platform

  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "topics" do
    field(:long_desc, :string)
    field(:name, :string)
    field(:short_desc, :string)

    many_to_many(:providers, EctoAssoc.Provider, join_through: "providers_topics")
    timestamps()
  end

  @doc false
  def changeset(topic, attrs) do
    topic
    |> cast(attrs, [:name, :short_desc, :long_desc])
    |> validate_required([:name, :short_desc, :long_desc])
  end
end
