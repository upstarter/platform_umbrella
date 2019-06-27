defmodule Platform.Groupings.Grouping do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groupings" do
    field(:group_type, :string)
    field(:member_type, :string)

    belongs_to(:group, Platform.Groupings.Group)
    belongs_to(:member, Platform.Users.User)
    timestamps()
  end

  @doc false
  def changeset(grouping, attrs) do
    grouping
    |> cast(attrs, [:member_id, :member_type, :group_id, :group_type])
    |> validate_required([:member_id, :member_type, :group_id, :group_type])
  end
end
