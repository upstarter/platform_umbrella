defmodule Platform.Taggings do
  @moduledoc """
  The Taggings context.
  """

  import Ecto.Query, warn: false
  alias Platform.Repo

  alias Platform.Taggings.Tagging

  @doc """
  Returns the list of taggings.

  ## Examples

      iex> list_taggings()
      [%Tagging{}, ...]

  """
  def list_taggings do
    Repo.all(Tagging)
  end

  @doc """
  Gets a single tagging.

  Raises `Ecto.NoResultsError` if the Tagging does not exist.

  ## Examples

      iex> get_tagging!(123)
      %Tagging{}

      iex> get_tagging!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tagging!(id), do: Repo.get!(Tagging, id)

  @doc """
  Creates a tagging.

  ## Examples

      iex> create_tagging(%{field: value})
      {:ok, %Tagging{}}

      iex> create_tagging(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tagging(attrs \\ %{}) do
    %Tagging{}
    |> Tagging.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tagging.

  ## Examples

      iex> update_tagging(tagging, %{field: new_value})
      {:ok, %Tagging{}}

      iex> update_tagging(tagging, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tagging(%Tagging{} = tagging, attrs) do
    tagging
    |> Tagging.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Tagging.

  ## Examples

      iex> delete_tagging(tagging)
      {:ok, %Tagging{}}

      iex> delete_tagging(tagging)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tagging(%Tagging{} = tagging) do
    Repo.delete(tagging)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tagging changes.

  ## Examples

      iex> change_tagging(tagging)
      %Ecto.Changeset{source: %Tagging{}}

  """
  def change_tagging(%Tagging{} = tagging) do
    Tagging.changeset(tagging, %{})
  end
end
