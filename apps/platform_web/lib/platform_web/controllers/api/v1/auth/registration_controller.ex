defmodule PlatformWeb.V1.Auth.RegistrationController do
  use PlatformWeb, :controller
  plug(Ueberauth)
  alias Ueberauth.Strategy.Helpers

  alias Platform.Auth
  alias Platform.Users.User
  alias Platform.Auth.Credential
  alias Platform.Repo

  alias PlatformWeb.Auth.Guardian
  # plug(Guardian.Plug.EnsureAuthenticated, handler: PlatformWeb.SessionsController)
  plug(:scrub_params, "auth" when action in [:create])

  def create(conn, _auth_params = %{"auth" => params}) do
    with {:ok, %{} = user_info} <- Auth.create_account(params),
         {:ok, conn, jwt} <- authenticate(user_info, conn) do
      conn
      |> put_status(201)
      |> render("create.json", jwt: jwt, csrf: get_csrf_token())
    else
      _ ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json")
    end
  end

  def authenticate(user_info, conn) do
    cred = List.last(user_info.credentials)
    user = Repo.get_by(User, id: cred.user_id)

    conn =
      Guardian.Plug.sign_in(
        conn,
        user,
        %{roles: [:user, :analyst]},
        token_type: "refresh",
        http_only: false,
        secure: false
      )

    jwt_refresh = Guardian.Plug.current_token(conn)

    {:ok, _old_stuff, {jwt, %{"exp" => _exp} = _new_claims}} =
      Guardian.exchange(jwt_refresh, "refresh", "access")

    thirty_days = 86400 * 30

    conn =
      put_resp_cookie(conn, "_cw_rem", jwt_refresh,
        max_age: thirty_days,
        http_only: false,
        secure: false
      )

    IO.inspect([
      'reg guardian',
      conn,
      jwt_refresh,
      jwt,
      conn.resp_cookies,
      conn.resp_headers
    ])

    {:ok, conn, jwt}
  end

  def request(conn, _params) do
    render(conn, "request.json", auth: conn, callback_url: Helpers.callback_url(conn))
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "You have been logged out!")
    |> configure_session(drop: true)
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "Failed to authenticate.")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    case UserFromAuth.find_or_create(auth) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Successfully authenticated.")
        |> put_session(:current_user, user)
        |> configure_session(renew: true)
        |> redirect(to: "/")

      {:error, reason} ->
        conn
        |> put_flash(:error, reason)
        |> redirect(to: "/")
    end
  end

  # def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
  #   user_params = %{token: auth.credentials.token, email: auth.info.email, provider: "google"}
  #   changeset = User.changeset(%User{}, user_params)
  #
  #   signin(conn, changeset)
  # end

  def show(conn, %{"jwt" => jwt}) do
    auth = Repo.get_by(Credential, token: jwt)
    render(conn, "jwt.json", jwt: jwt)
  end
end
