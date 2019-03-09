defmodule Platform.Analysts do
  @moduledoc """
  The Analysts context.
  """

  import Ecto.Query, warn: false
  alias Platform.Repo

  alias Platform.Analysts.Analyst

  @doc """
  Returns the list of analysts.

  ## Examples

      iex> list_analysts()
      [%Analyst{}, ...]

  """
  def list_analysts do
    Repo.all(Analyst)
  end

  @doc """
  Gets a single analyst.

  Raises `Ecto.NoResultsError` if the Analyst does not exist.

  ## Examples

      iex> get_analyst!(123)
      %Analyst{}

      iex> get_analyst!(456)
      ** (Ecto.NoResultsError)

  """
  def get_analyst!(id), do: Repo.get!(Analyst, id)

  @doc """
  Creates a analyst.

  ## Examples

      iex> create_analyst(%{field: value})
      {:ok, %Analyst{}}

      iex> create_analyst(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_analyst(attrs \\ %{}) do
    %Analyst{}
    |> Analyst.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a analyst.

  ## Examples

      iex> update_analyst(analyst, %{field: new_value})
      {:ok, %Analyst{}}

      iex> update_analyst(analyst, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_analyst(%Analyst{} = analyst, attrs) do
    analyst
    |> Analyst.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Analyst.

  ## Examples

      iex> delete_analyst(analyst)
      {:ok, %Analyst{}}

      iex> delete_analyst(analyst)
      {:error, %Ecto.Changeset{}}

  """
  def delete_analyst(%Analyst{} = analyst) do
    Repo.delete(analyst)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking analyst changes.

  ## Examples

      iex> change_analyst(analyst)
      %Ecto.Changeset{source: %Analyst{}}

  """
  def change_analyst(%Analyst{} = analyst) do
    Analyst.changeset(analyst, %{})
  end
end
