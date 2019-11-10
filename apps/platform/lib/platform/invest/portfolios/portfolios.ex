defmodule Platform.Portfolios do
  @moduledoc """
  The Portfolios context.
  """

  import Ecto.Query, warn: false
  alias Platform.Repo

  alias Platform.Portfolios.Portfolio

  @doc """
  Returns the list of portfolios.

  ## Examples

      iex> list_portfolios()
      [%Portfolio{}, ...]

  """
  def list_portfolios do
    Repo.all(Portfolio)
  end

  @doc """
  Gets a single portfolio.

  Raises `Ecto.NoResultsError` if the Portfolio does not exist.

  ## Examples

      iex> get_portfolio!(123)
      %Portfolio{}

      iex> get_portfolio!(456)
      ** (Ecto.NoResultsError)

  """
  def get_portfolio!(id), do: Repo.get!(Portfolio, id)

  @doc """
  Creates a portfolio.

  ## Examples

      iex> create_portfolio(%{field: value})
      {:ok, %Portfolio{}}

      iex> create_portfolio(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_portfolio(attrs \\ %{}) do
    with {:ok, %{} = portfolio} <- Repo.get!(Portfolio, 1) do
      with {:ok, portfolio} <- portfolio |> Portfolio.changeset(attrs) |> Repo.update() do
        {:ok, portfolio}
      else
        _ ->
          {:error, "Update Error"}
      end
    else
      _ ->
        with {:ok, %{} = portfolio} <- Portfolio.create(attrs) do
          {:ok, portfolio}
        else
          _ ->
            {:error, "Create Error"}
        end
    end
  end

  @doc """
  Updates a portfolio.

  ## Examples

      iex> update_portfolio(portfolio, %{field: new_value})
      {:ok, %Portfolio{}}

      iex> update_portfolio(portfolio, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_portfolio(%Portfolio{} = portfolio, attrs) do
    portfolio
    |> Portfolio.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Portfolio.

  ## Examples

      iex> delete_portfolio(portfolio)
      {:ok, %Portfolio{}}

      iex> delete_portfolio(portfolio)
      {:error, %Ecto.Changeset{}}

  """
  def delete_portfolio(%Portfolio{} = portfolio) do
    Repo.delete(portfolio)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking portfolio changes.

  ## Examples

      iex> change_portfolio(portfolio)
      %Ecto.Changeset{source: %Portfolio{}}

  """
  def change_portfolio(%Portfolio{} = portfolio) do
    Portfolio.changeset(portfolio, %{})
  end
end
