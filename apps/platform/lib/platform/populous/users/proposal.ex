defmodule Platform.Users.Proposal do
  use Ecto.Schema
  import Ecto.Changeset

  schema "proposals" do
    field(:title, :string, default: false)
    field(:description, :string, default: false)
    field(:active, :boolean, default: false)
    field(:status, :string)
    field(:type, :string)
    field(:user_id, :integer)
    field(:cached_votes_for_total, :integer)

    timestamps()
  end

  @fields ~w(:title :description :type :status :active :user_id :cached_votes_for_total)a

  @doc false
  def changeset(proposal, attrs) do
    proposal
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
