defmodule Platform.Users.Profiles.UserRole do
  use Ecto.Schema

  alias Platform.Users.User
  alias Platform.Users.Profiles
  alias Profiles.{Role, UserProfile}

  schema "users_roles" do
    belongs_to(:user, User)
    belongs_to(:user_profile, UserProfile)
    belongs_to(:role, Role)
    field(:active, :boolean)
    # basic, upsold
    field(:type, :string)
    field(:status, :string)
    timestamps()
  end

  # assoc(user, :roles) |> UserRole.active() |> Repo.all()
  # def active(query) do
  #   from(ur in query,
  #     where: active == true
  #   )
  # end
end
