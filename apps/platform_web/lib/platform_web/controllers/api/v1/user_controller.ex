defmodule PlatformWeb.Users.UserController do
  alias Platform.Auth
  alias Platform.Auth.Guardian
  use PlatformWeb, :controller
  alias Platform.Users.User
  plug :scrub_params, "user" when action in [:create, :sign_in]


  def sign_in(conn, %{"password" => "password"}) do
    user = %{id: "1"}

    conn
    |> Guardian.Plug.sign_in(user)
    |> send_resp(204, "")
  end

#   case User.find_and_confirm_password(params) do
#   {:ok, user} ->
#      new_conn = Guardian.Plug.api_sign_in(conn, user)
#      jwt = Guardian.Plug.current_token(new_conn)
#      claims = Guardian.Plug.claims(new_conn)
#      exp = Map.get(claims, "exp")
#
#      new_conn
#      |> put_resp_header("authorization", "Bearer #{jwt}")
#      |> put_resp_header("x-expires", exp)
#      |> render "login.json", user: user, jwt: jwt, exp: exp
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
    changeset = User.changeset(%User{}, _params)
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = %User{} |> User.registration_changeset(user_params)
    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> Guardian.Plug.sign_in(user, %{sub: user.id})
        |> redirect(to: "/")
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
     end
   end

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.html", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    render(conn, "show.html", user: user)
  end

end
