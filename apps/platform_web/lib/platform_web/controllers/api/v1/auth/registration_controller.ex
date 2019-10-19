defmodule PlatformWeb.V1.Auth.RegistrationController do
  use PlatformWeb, :controller
  plug(Ueberauth)
  alias Ueberauth.Strategy.Helpers

  alias Platform.Auth
  alias Platform.Users.User
  alias Platform.Auth.Credential
  alias Platform.Repo

  alias PlatformWeb.Auth.Guardian
  require Logger
  # plug(Guardian.Plug.EnsureAuthenticated, handler: PlatformWeb.SessionsController)
  plug(:scrub_params, "auth" when action in [:create])

  def create(conn, _auth_params = %{"auth" => params}) do
    with {:ok, %{} = user_info} <- Auth.create_account(params),
         {:ok, conn, jwt} <- authenticate(user_info, conn) do
      conn
      |> put_status(201)
      |> render("create.json", user: "worked")
    else
      _ ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json")
    end
  end

  # I'd like to secure my SPA private routes with JWT authentication. To make
  # everything as much secure as it's possible, I wanted to use httpOnly cookie to
  # store my access_token on the client-side.
  #
  # Using httpOnly cookies protect me a lot from XSS attacks, but unfortunately
  # this approach does not allow me to check if the cookie actually exists in the
  # browser.
  #
  # In this case - how can I implement some logic to prevent unlogged users to
  # visit private, secure routes of my SPA?

  #  Am I forced to use non-httpOnly cookies or localStorage for this?
  #
  #  No. Keep your access_token in a cookie with the httpOnly flag, and (if
  #  possible) with the secure flag. Let's call this cookie session_cookie.
  #
  #  When a user does a successful login you could return 2 cookies: the
  #  session_cookie and another one which informs to JS the user has been
  #  authenticated (let's call as SPA cookie).
  #
  #  Your session_cookie is not accessible by JS so it's not vulnerable to XSS.
  #  This cookie is sent on each request to the server, which checks is a valid
  #  token, otherwise an unauthorized error is returned.
  #
  #  Your SPA cookie has no httpOnly flag so it's accessible by JS but the server
  #  doesn't use it to authenticate the user, so fake this cookie is useless.
  #
  #  Whenever you receive an unauthorized error on your SPA you can remove the SPA cookie.

  def authenticate(user_info, conn) do
    cred = List.last(user_info.credentials)
    user = Repo.get_by(User, id: cred.user_id)

    IO.inspect([
      'reg user',
      user
    ])

    # Logger.info(cred)
    # Logger.debug(user)
    # {:ok, jwt_refresh, _full_claims} =
    #   Guardian.encode_and_sign(
    #     user,
    #     token_type: "refresh"
    #   )

    conn =
      Guardian.Plug.sign_in(
        conn,
        user,
        %{},
        token_type: "refresh"
      )

    {:ok, jwt, _full_claims} =
      Guardian.encode_and_sign(
        user,
        %{},
        token_type: "access"
      )

    thirty_days = 86400 * 30

    conn =
      conn
      |> put_resp_cookie("_cw_acc", jwt,
        max_age: thirty_days,
        http_only: false,
        secure: false,
        domain: '.cryptowise.ai'
      )

    #   |> put_resp_cookie("_cw_rem", jwt,
    #     max_age: thirty_days,
    #     http_only: true,
    #     # make true in prod, use _cw_acc for protected resources
    #     secure: false
    #   )

    IO.inspect([
      'reg guardian',
      conn,
      # jwt_refresh,
      # jwt,
      conn.resp_cookies,
      conn.resp_headers
    ])

    {:ok, conn, nil}
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
