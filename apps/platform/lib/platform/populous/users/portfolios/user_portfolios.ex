defmodule Platform.Users.Portfolios.UserPortfolios do
  @moduledoc """
  The UserPortfolios context.
  """

  import Ecto.Query, warn: false
  alias Platform.Repo

  alias Platform.Portfolios.Portfolio
  alias Platform.Users.Portfolios.UserPortfolio

  @doc """
  Returns the list of user_portfolios.

  ## Examples

      iex> list_user_portfolios()
      [%Portfolio{}, ...]

  """
  def list_user_portfolios do
    Repo.all(UserPortfolio)
  end

  @doc """
  Gets a single user_portfolio.

  Raises `Ecto.NoResultsError` if the UserPortfolio does not exist.

  ## Examples

      iex> get_user_portfolio!(123)
      %UserPortfolio{}

      iex> get_user_portfolio!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_portfolio!(id), do: Repo.get!(UserPortfolio, id)

  @doc """
  Creates a user_portfolio.

  ## Examples

      iex> create_user_portfolio(%{field: value})
      {:ok, %UserPortfolio{}}

      iex> create_user_portfolio(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_portfolio(attrs \\ %{}) do
    with {:ok, user_portfolio} <-
           UserPortfolio.changeset(%UserPortfolio{}, attrs) |> Repo.update() do
      {:ok, user_portfolio}
    else
      _ ->
        with {:ok, %{} = user_portfolio} <- UserPortfolio.create(attrs) do
          {:ok, user_portfolio}
        else
          _ ->
            {:error, "Create Error"}
        end
    end
  end

  @doc """
  Updates a user_portfolio.

  ## Examples

      iex> update_user_portfolio(user_portfolio, %{field: new_value})
      {:ok, %UserPortfolio{}}

      iex> update_user_portfolio(user_portfolio, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_portfolio(%UserPortfolio{} = user_portfolio, attrs) do
    user_portfolio
    |> UserPortfolio.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a UserPortfolio.

  ## Examples

      iex> delete_user_portfolio(user_portfolio)
      {:ok, %UserPortfolio{}}

      iex> delete_user_portfolio(user_portfolio)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_portfolio(%UserPortfolio{} = user_portfolio) do
    Repo.delete(user_portfolio)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking portfolio changes.

  ## Examples

      iex> change_portfolio(portfolio)
      %Ecto.Changeset{source: %UserPortfolio{}}

  """
  def change_user_portfolio(%UserPortfolio{} = user_portfolio) do
    UserPortfolio.changeset(user_portfolio, %{})
  end
end
