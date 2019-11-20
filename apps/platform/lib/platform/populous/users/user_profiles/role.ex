defmodule Platform.Users.Profiles.Role do
  @moduledoc """
    roles on the platform
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__
  alias Platform.Users.User
  alias Platform.Users.UserRole

  schema "roles" do
    field(:title, :string)

    many_to_many(:users, User, join_through: UserRole)
    many_to_many(:roles, Role, join_through: UserRole)
    timestamps()
  end

  @roles ~w(admin user curator strategist engineer analyst tpm)

  @doc false
  def changeset(topic, attrs) do
    topic
    |> cast(attrs, [:title])
    |> validate_required([:title])
    |> unique_constraint(:title, name: :role_title_index)
    |> validate_inclusion(:title, @roles, message: "should be one of: [#{Enum.join(@roles, " ")}]")
  end
end
