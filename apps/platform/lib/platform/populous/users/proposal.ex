defmodule Platform.Users.Proposal do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias Platform.Repo
  alias Platform.Users.Proposal

  schema "proposals" do
    field(:title, :string)
    field(:description, :string)
    field(:active, :boolean, default: false)
    field(:status, :string)
    field(:type, :string)
    field(:is_public, :boolean, default: false)
    field(:cached_votes_for_total, :integer)

    belongs_to(:user, Platform.Users.User)

    timestamps()
  end

  def list_proposals(params) do
    page = String.to_integer(params["page"])
    per_page = String.to_integer(params["per_page"])

    offset = if page > 1, do: (page - 1) * per_page, else: 0

    q = from(p in Proposal, limit: ^per_page, offset: ^offset)

    q
    |> Repo.all()
    |> Repo.preload(:user)
  end

  @fields ~w(title description type status active user_id is_public)a
  @required_fields ~w(title type status active user_id is_public)a

  def create_for_user(attrs) do
    attrs = Map.merge(attrs, %{"type" => "Genesis", "status" => "initial", "is_public" => true})
    changeset = Proposal.changeset(%Proposal{}, attrs)
    IO.inspect(['create for user', attrs, changeset])

    changeset
    |> Repo.insert()
  end

  def validate(%Ecto.Changeset{} = changeset) do
    changeset
    |> validate_required([:title, :description, :user_id])
  end

  @doc false
  def changeset(proposal, attrs) do
    proposal
    |> cast(attrs, @fields)
    |> validate_required(@required_fields)
    |> validate_length(:title, min: 1, max: 255)
  end
end
