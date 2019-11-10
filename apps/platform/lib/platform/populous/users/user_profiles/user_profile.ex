defmodule Platform.Users.Profiles.UserProfile do
  use Ecto.Schema
  import Ecto.Changeset

  alias Platform.Users.Profiles.Role

  schema "user_profiles" do
    embeds_many(:roles, Role)

    timestamps()
  end

  def validate_roles(changeset, attrs, options \\ []) do
    validate_change(changeset, attrs, fn _ ->
      case Repo.get() do
        "curator" -> []
        _ -> [{attrs, options[:message] || "Unexpected Role"}]
      end
    end)
  end

  @doc false
  def changeset(user_profile, attrs) do
    user_profile
    |> cast(attrs, [:roles])
    |> validate_required([:roles])
    |> validate_roles(attrs)
    |> Changeset.validate_inclusion(:roles, @roles)
  end
end
