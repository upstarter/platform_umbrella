defmodule Platform.Users.Groups.UserGroups do
  @moduledoc """
  The UserGroups context.
  """

  import Ecto.Query, warn: false
  alias Platform.Repo

  alias Platform.Users.Groups.UserGroup

  @doc """
  Returns the list of groupings.

  ## Examples

      iex> list_groupings()
      [%UserGroup{}, ...]

  """
  def list_groupings do
    Repo.all(UserGroup)
  end

  @doc """
  Gets a single grouping.

  Raises `Ecto.NoResultsError` if the UserGroup does not exist.

  ## Examples

      iex> get_grouping!(123)
      %UserGroup{}

      iex> get_grouping!(456)
      ** (Ecto.NoResultsError)

  """
  def get_grouping!(id), do: Repo.get!(UserGroup, id)

  @doc """
  Creates a grouping.

  ## Examples

      iex> create_grouping(%{field: value})
      {:ok, %UserGroup{}}

      iex> create_grouping(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_grouping(attrs \\ %{}) do
    %UserGroup{}
    |> UserGroup.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a grouping.

  ## Examples

      iex> update_grouping(grouping, %{field: new_value})
      {:ok, %UserGroup{}}

      iex> update_grouping(grouping, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_grouping(%UserGroup{} = grouping, attrs) do
    grouping
    |> UserGroup.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a UserGroup.

  ## Examples

      iex> delete_grouping(grouping)
      {:ok, %UserGroup{}}

      iex> delete_grouping(grouping)
      {:error, %Ecto.Changeset{}}

  """
  def delete_grouping(%UserGroup{} = grouping) do
    Repo.delete(grouping)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking grouping changes.

  ## Examples

      iex> change_grouping(grouping)
      %Ecto.Changeset{source: %UserGroup{}}

  """
  def change_grouping(%UserGroup{} = grouping) do
    UserGroup.changeset(grouping, %{})
  end
end
