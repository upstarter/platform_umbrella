defmodule Platform.Groupings do
  @moduledoc """
  The Groupings context.
  """

  import Ecto.Query, warn: false
  alias Platform.Repo

  alias Platform.Groupings.Grouping

  @doc """
  Returns the list of groupings.

  ## Examples

      iex> list_groupings()
      [%Grouping{}, ...]

  """
  def list_groupings do
    Repo.all(Grouping)
  end

  @doc """
  Gets a single grouping.

  Raises `Ecto.NoResultsError` if the Grouping does not exist.

  ## Examples

      iex> get_grouping!(123)
      %Grouping{}

      iex> get_grouping!(456)
      ** (Ecto.NoResultsError)

  """
  def get_grouping!(id), do: Repo.get!(Grouping, id)

  @doc """
  Creates a grouping.

  ## Examples

      iex> create_grouping(%{field: value})
      {:ok, %Grouping{}}

      iex> create_grouping(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_grouping(attrs \\ %{}) do
    %Grouping{}
    |> Grouping.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a grouping.

  ## Examples

      iex> update_grouping(grouping, %{field: new_value})
      {:ok, %Grouping{}}

      iex> update_grouping(grouping, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_grouping(%Grouping{} = grouping, attrs) do
    grouping
    |> Grouping.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Grouping.

  ## Examples

      iex> delete_grouping(grouping)
      {:ok, %Grouping{}}

      iex> delete_grouping(grouping)
      {:error, %Ecto.Changeset{}}

  """
  def delete_grouping(%Grouping{} = grouping) do
    Repo.delete(grouping)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking grouping changes.

  ## Examples

      iex> change_grouping(grouping)
      %Ecto.Changeset{source: %Grouping{}}

  """
  def change_grouping(%Grouping{} = grouping) do
    Grouping.changeset(grouping, %{})
  end
end
