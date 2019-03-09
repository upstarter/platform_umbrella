defmodule Platform.Investors do
  @moduledoc """
  The Investors context.
  """

  import Ecto.Query, warn: false
  alias Platform.Repo

  alias Platform.Investors.Investor

  @doc """
  Returns the list of investors.

  ## Examples

      iex> list_investors()
      [%Investor{}, ...]

  """
  def list_investors do
    Repo.all(Investor)
  end

  @doc """
  Gets a single investor.

  Raises `Ecto.NoResultsError` if the Investor does not exist.

  ## Examples

      iex> get_investor!(123)
      %Investor{}

      iex> get_investor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_investor!(id), do: Repo.get!(Investor, id)

  @doc """
  Creates a investor.

  ## Examples

      iex> create_investor(%{field: value})
      {:ok, %Investor{}}

      iex> create_investor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_investor(attrs \\ %{}) do
    %Investor{}
    |> Investor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a investor.

  ## Examples

      iex> update_investor(investor, %{field: new_value})
      {:ok, %Investor{}}

      iex> update_investor(investor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_investor(%Investor{} = investor, attrs) do
    investor
    |> Investor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Investor.

  ## Examples

      iex> delete_investor(investor)
      {:ok, %Investor{}}

      iex> delete_investor(investor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_investor(%Investor{} = investor) do
    Repo.delete(investor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking investor changes.

  ## Examples

      iex> change_investor(investor)
      %Ecto.Changeset{source: %Investor{}}

  """
  def change_investor(%Investor{} = investor) do
    Investor.changeset(investor, %{})
  end
end
