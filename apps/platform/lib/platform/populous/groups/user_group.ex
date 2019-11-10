defmodule Platform.Users.Groups.UserGroup do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_groups" do
    field(:group_type, :string)
    field(:member_type, :string)

    belongs_to(:group, Platform.Groups.Group)
    belongs_to(:member, Platform.Users.User)
    timestamps()
  end

  @doc false
  def changeset(user_group, attrs) do
    user_group
    |> cast(attrs, [:member_id, :member_type, :group_id, :group_type])
    |> validate_required([:member_id, :member_type, :group_id, :group_type])
  end
end
