defmodule Platform.Users.Profiles.UserProfile do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__
  alias Platform.Users.Profiles.{Role, UserRole}
  alias Platform.Users.User

  schema "user_profiles" do
    belongs_to(:user, User)

    has_many(:user_roles, UserRole)
    has_many(:roles, through: [:user_roles, :role], on_delete: :delete_all)

    timestamps()
  end

  @doc false
  def changeset(user_profile, attrs) do
    user_profile
    |> cast(attrs, [:user_id])
    |> validate_required([:user_id])
  end
end
