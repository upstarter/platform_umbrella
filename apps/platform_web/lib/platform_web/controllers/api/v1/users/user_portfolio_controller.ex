defmodule PlatformWeb.V1.Users.UserPortfolioController do
  use PlatformWeb, :controller
  require Logger

  alias Platform.Portfolios
  alias Platform.Users.Portfolios.UserPortfolios
  alias Platform.Users.Portfolios.UserPortfolio
  alias PlatformWeb.V1.Portfolios.UserPortfolioView
  alias PlatformWeb.Router.Helpers, as: Routes

  def index(conn, _params) do
    portfolios = UserPortfolios.list_portfolios()
    render(conn, "index.json", portfolios: portfolios)
  end

  def new(conn, _params) do
    changeset = UserPortfolio.changeset(UserPortfolio, _params)
    render(conn, "new.json", portfolio: changeset)
  end

  def create(conn, portfolio_params) do
    with {:ok, %{} = user_portfolio} <- UserPortfolios.create_user_portfolio(portfolio_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_portfolio_path(conn, :show, user_portfolio))
      |> render("show.json", user_portfolio: user_portfolio)
    else
      {:error, portfolio} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json", portfolio: portfolio)
    end
  end

  def show(conn, %{"id" => id}) do
    portfolio = UserPortfolios.get_portfolio!(id)
    render(conn, "show.json", portfolio: portfolio)
  end

  def update(conn, %{"id" => id, "portfolio" => portfolio_params}) do
    portfolio = UserPortfolios.get_portfolio!(id)

    with {:ok, UserPortfolio = portfolio} <-
           UserPortfolios.update_portfolio(portfolio, portfolio_params) do
      render(conn, "show.json", portfolio: portfolio)
    end
  end

  def delete(conn, %{"id" => id}) do
    portfolio = UserPortfolios.get_portfolio!(id)

    with {:ok, UserPortfolio} <- UserPortfolios.delete_portfolio(portfolio) do
      send_resp(conn, :no_content, "")
    end
  end
end
