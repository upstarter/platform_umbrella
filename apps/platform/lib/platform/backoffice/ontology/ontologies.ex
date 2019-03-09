defmodule Platform.Ontologies do
  @moduledoc """
  The Ontologies context.
  """

  import Ecto.Query, warn: false
  alias Platform.Repo

  alias Platform.Ontologies.Ontology

  @doc """
  Returns the list of ontologies.

  ## Examples

      iex> list_ontologies()
      [%Ontology{}, ...]

  """
  def list_ontologies do
    Repo.all(Ontology)
  end

  @doc """
  Gets a single ontology.

  Raises `Ecto.NoResultsError` if the Ontology does not exist.

  ## Examples

      iex> get_ontology!(123)
      %Ontology{}

      iex> get_ontology!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ontology!(id), do: Repo.get!(Ontology, id)

  @doc """
  Creates a ontology.

  ## Examples

      iex> create_ontology(%{field: value})
      {:ok, %Ontology{}}

      iex> create_ontology(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ontology(attrs \\ %{}) do
    %Ontology{}
    |> Ontology.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ontology.

  ## Examples

      iex> update_ontology(ontology, %{field: new_value})
      {:ok, %Ontology{}}

      iex> update_ontology(ontology, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ontology(%Ontology{} = ontology, attrs) do
    ontology
    |> Ontology.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Ontology.

  ## Examples

      iex> delete_ontology(ontology)
      {:ok, %Ontology{}}

      iex> delete_ontology(ontology)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ontology(%Ontology{} = ontology) do
    Repo.delete(ontology)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ontology changes.

  ## Examples

      iex> change_ontology(ontology)
      %Ecto.Changeset{source: %Ontology{}}

  """
  def change_ontology(%Ontology{} = ontology) do
    Ontology.changeset(ontology, %{})
  end
end
