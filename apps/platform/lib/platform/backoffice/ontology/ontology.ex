defmodule Platform.Ontologies.Ontology do
  @moduledoc """

  Categories
  Properties
  Relations
    - between
  Concepts
  Data
  Entities
    - that substantiate one, many, or all domains

  subject: the 'target' instance object, most abstract, most specific, focal point
  context: encapsulating, environmental, situational, tactical, observable, analytical space from
           which measurements can be made
  representation: of knowledge
  perspective: worldview, viewpoint
  constraint: limiting or confounding factor, in-capability, probable blind spot, rule
  class: set, collection, concepts, kinds of things

  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "ontologies" do
    field(:constraint_id, :integer)
    field(:perspective_id, :integer)
    field(:representation_id, :integer)
    field(:context_id, :integer)
    field(:context_type, :string)
    field(:class_id, :integer)
    field(:class_type, :string)
    field(:subject, :string)

    timestamps()
  end

  @doc false
  def changeset(ontology, attrs) do
    ontology
    |> cast(attrs, [:subject_id, :representation_id, :perspective_id, :constraint_id])
    |> validate_required([:subject_id, :representation_id, :perspective_id, :constraint_id])
  end
end
