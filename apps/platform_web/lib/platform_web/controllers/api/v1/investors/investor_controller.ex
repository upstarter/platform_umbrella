defmodule PlatformWeb.V1.Investors.InvestorController do
  use PlatformWeb, :controller

  alias Platform.Investors
  alias Platform.Investors.Investor

  def index(conn, _params) do
    investors = Investors.list_investors()
    render(conn, "index.json", investors: investors)
  end

  def create(conn, %{"investor" => investor_params}) do
    with {:ok, %Investor{} = investor} <- Investors.create_investor(investor_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.investor_path(conn, :show, investor))
      |> render("show.json", investor: investor)
    end
  end

  def show(conn, %{"id" => id}) do
    investor = Investors.get_investor!(id)
    render(conn, "show.json", investor: investor)
  end

  def update(conn, %{"id" => id, "investor" => investor_params}) do
    investor = Investors.get_investor!(id)

    with {:ok, %Investor{} = investor} <- Investors.update_investor(investor, investor_params) do
      render(conn, "show.json", investor: investor)
    end
  end

  def delete(conn, %{"id" => id}) do
    investor = Investors.get_investor!(id)

    with {:ok, %Investor{}} <- Investors.delete_investor(investor) do
      send_resp(conn, :no_content, "")
    end
  end
end
