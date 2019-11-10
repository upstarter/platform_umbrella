defmodule PlatformWeb.V1.Portfolios.PortfolioController do
  use PlatformWeb, :controller
  require Logger

  alias Platform.Portfolios
  alias Platform.Portfolios.Portfolio
  alias PlatformWeb.V1.Portfolios.PortfolioView
  alias PlatformWeb.Router.Helpers, as: Routes

  def index(conn, _params) do
    portfolios = Portfolios.list_portfolios()
    render(conn, "index.json", portfolios: portfolios)
  end

  def new(conn, _params) do
    changeset = Portfolio.changeset(Portfolio, _params)
    render(conn, "new.json", portfolio: changeset)
  end

  def create(conn, portfolio_params) do
    with {:ok, %{} = portfolio} <- Portfolios.create_portfolio(portfolio_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.portfolio_path(conn, :show, portfolio))
      |> render("show.json", portfolio: portfolio)
    else
      {:error, portfolio} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json", portfolio: portfolio)
    end
  end

  def show(conn, %{"id" => id}) do
    portfolio = Portfolios.get_portfolio!(id)
    render(conn, "show.json", portfolio: portfolio)
  end

  def update(conn, %{"id" => id, "portfolio" => portfolio_params}) do
    portfolio = Portfolios.get_portfolio!(id)

    with {:ok, Portfolio = portfolio} <-
           Portfolios.update_portfolio(portfolio, portfolio_params) do
      render(conn, "show.json", portfolio: portfolio)
    end
  end

  def delete(conn, %{"id" => id}) do
    portfolio = Portfolios.get_portfolio!(id)

    with {:ok, Portfolio} <- Portfolios.delete_portfolio(portfolio) do
      send_resp(conn, :no_content, "")
    end
  end
end
