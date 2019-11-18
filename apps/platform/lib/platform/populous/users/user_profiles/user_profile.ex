defmodule Platform.Users.Profiles.UserProfile do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__
  alias Platform.Users.Profiles.{Role, UserRole}
  alias Platform.Users.User

  schema "user_profiles" do
    belongs_to(:user, User)
    many_to_many(:roles, Role, join_through: UserRole)

    timestamps()
  end

  def add_roles(changeset, attrs, options \\ []) do
    user_profile = Repo.get!(User, attrs["user_id"])
    role = %Role{title: attrs["role"]}

    user_roles = [%UserRole{role_id: role.id, user_id: user_profile.user_id}]

    # changeset =
    #   user_profile
    #   |> Ecto.Changeset.change()
    #   |> Ecto.Changeset.put_change(:roles, roles)
  end

  @doc false
  def changeset(user_profile, attrs) do
    user_profile
    |> cast(attrs, [:roles])
    |> validate_required([:roles])
    |> Changeset.validate_inclusion(:roles, @roles)
  end
end
