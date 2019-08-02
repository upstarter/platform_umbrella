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
         {:ok, conn, jwt} <- unpack_user_info(user_info, conn) do
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

  def unpack_user_info(user_info, conn) do
    cred = List.last(user_info.credentials)
    user = Repo.get_by(User, id: cred.user_id)

    conn =
      conn
      |> Guardian.Plug.sign_in(user)
      |> put_session(:current_user, user)
      |> assign(:current_user, user)

    # |> Guardian.Plug.remember_me(user)

    token = Guardian.Plug.current_token(conn)

    IO.inspect([
      'guardian',
      Guardian.Plug.current_resource(conn),
      token,
      conn
    ])

    {:ok, conn, token}
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
