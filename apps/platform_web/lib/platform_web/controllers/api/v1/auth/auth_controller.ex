defmodule PlatformWeb.V1.Auth.AuthController do
  use PlatformWeb, :controller
  plug(Ueberauth)

  alias Platform.Auth
  alias Platform.Auth.Account
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

  # case Auth.find_and_confirm_password(params) do
  #   {:ok, auth} ->
  #      new_conn = Guardian.Plug.api_sign_in(conn, auth)
  #      jwt = Guardian.Plug.current_token(new_conn)
  #      claims = Guardian.Plug.claims(new_conn)
  #      exp = Map.get(claims, "exp")
  #
  #      new_conn
  #      |> put_resp_header("authorization", "Bearer #{jwt}")
  #      |> put_resp_header("x-expires", exp)
  #      |> render "login.json", auth: auth, jwt: jwt, exp: exp
  #   {:error, changeset} ->
  #     conn
  #     |> put_status(401)
  #     |> render "error.json", message: "Could not login"
  # end

  # def create(conn, %{"auth" => auth_params}) do
  #   changeset = %Account{} |> Account.changeset(auth_params)
  #
  #   case Repo.insert(changeset) do
  #     {:ok, auth} ->
  #       conn
  #       |> Guardian.Plug.sign_in(auth, %{sub: auth.id})
  #       |> put_status(201)
  #       |> render("show.json", auth: auth)
  #
  #     {:error, changeset} ->
  #       conn
  #       |> put_status(422)
  #       |> render(PlatformWeb.ChangesetView, "error.json", changeset: changeset)
  #   end
  # end

  def show(conn, %{"id" => id}) do
    auth = Repo.get!(Account, id)
    IO.puts("##**********************")
    IO.inspect(auth)
    render(conn, "show.html", auth: auth)
  end
end
