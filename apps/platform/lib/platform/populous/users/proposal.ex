defmodule Platform.Users.Proposal do
  use Ecto.Schema
  import Ecto.Changeset

  schema "proposals" do
    field(:title, :string, default: false)
    field(:description, :string, default: false)
    field(:active, :boolean, default: false)
    field(:status, :string)
    field(:type, :string)
    field(:public, :boolean, default: false)
    field(:cached_votes_for_total, :integer)

    belongs_to(:user, Platform.Users.User)

    timestamps()
  end

  def create_for_user(params) do
    IO.inspect(['create for uer', params])
    # get curr user ID
  end

  def validate(%Ecto.Changeset{} = changeset) do
    changeset
    |> validate_required([:title, :description])
  end

  @fields ~w(:title :description :type :status :active :user_id)a

  @doc false
  def changeset(proposal, attrs) do
    proposal
    |> cast(attrs, @fields)
    |> validate_required(@fields)
    |> validate_length(:title, min: 1, max: 255)
  end
end
