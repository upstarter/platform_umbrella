defmodule PlatformWeb.V1.Auth.AuthController do
  alias Platform.Auth.Account
  alias Platform.Auth.Guardian
  use PlatformWeb, :controller
  alias Platform.Repo

  plug(:scrub_params, "auth" when action in [:create, :sign_in])

  def sign_in(conn, %{"password" => "password"}) do
    auth = %{id: "1"}

    conn
    |> Guardian.Plug.sign_in(auth)
    |> send_resp(204, "")
  end

  #   case Auth.find_and_confirm_password(params) do
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

  def sign_in(conn, _params) do
    send_resp(conn, 401, Poison.encode!(%{error: "Incorrect password"}))
  end

  def sign_out(conn, _params) do
    conn
    |> Guardian.Plug.sign_out()
    |> send_resp(204, "")
  end

  def new(conn, _params) do
    changeset = Account.changeset(%Account{}, _params)
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"auth" => auth_params}) do
    changeset = %Account{} |> Account.changeset(auth_params)

    case Repo.insert(changeset) do
      {:ok, auth} ->
        conn
        |> Guardian.Plug.sign_in(auth, %{sub: auth.id})
        |> render("show.json", auth: auth)

      {:error, changeset} ->
        conn |> render(PlatformWeb.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def index(conn, _params) do
    auths = Repo.all(Account)
    render(conn, "index.html", auths: auths)
  end

  def show(conn, %{"id" => id}) do
    auth = Repo.get!(Account, id)
    render(conn, "show.html", auth: auth)
  end
end
