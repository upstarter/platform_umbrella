defmodule Platform.Providers.Provider do
  @moduledoc """

    providers of services on the platform

  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "providers" do
    field(:name, :string)
    field(:email, :string)
    field(:short_desc, :string)
    belongs_to(:user, EctoAssoc.User)
    many_to_many(:topics, EctoAssoc.Topic, join_through: "providers_topics")

    timestamps()
  end

  def changeset(provider, attrs) do
    provider
    |> cast(attrs, [:user_id, :name, :desc])
    |> validate_required([:user_id, :name, :desc])
  end
end
