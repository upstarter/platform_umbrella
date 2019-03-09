defmodule PlatformWeb.V1.Auth.AuthController do
  use PlatformWeb, :controller
  plug(Ueberauth)

  alias Platform.Auth
  alias Platform.Accounts.Account
  alias Platform.Auth.TokenSerializer
  alias Platform.Repo

  plug(Guardian.Plug.EnsureAuthenticated, handler: PlatformWeb.SessionsController)

  plug(:scrub_params, "auth" when action in [:create])

  def create(conn, auth_params = %{"auth" => params}) do
    with {:ok, %Account{} = auth} <- Auth.create_account(auth_params),
         {:ok, token, _claims} <- Guardian.Plug.sign_in(conn, auth) do
      conn |> render("jwt.json", jwt: token)
    end
  end

  def show(conn, %{"id" => id}) do
    auth = Repo.get!(Account, id)
    IO.puts("##**********************")
    IO.inspect(auth)
    render(conn, "show.html", auth: auth)
  end
end
