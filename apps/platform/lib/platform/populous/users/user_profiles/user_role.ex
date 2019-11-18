defmodule Platform.Users.Profiles.UserRole do
  use Ecto.Schema

  alias Platform.Users.{Profiles.Role, User}

  schema "users_roles" do
    belongs_to(:user, User)
    belongs_to(:role, Role)
    field(:active, :boolean)
    # basic, upsold
    field(:type, :string)
    field(:status, :string)
    timestamps()
  end
end
