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
         {:ok, token, _claims} <- Guardian.encode_and_sign(List.last(user_info.credentials)) do
      conn |> render("jwt.json", jwt: token, user_info: Map.delete(user_info, :credentials))
    else
      _ ->
        # IO.puts(["$$$$$$$$$$$$$$$$", conn])
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json")
    end
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

  def show(conn, %{"id" => id}) do
    auth = Repo.get!(Credential, id)
    IO.puts("##**********************")
    IO.inspect(auth)
    render(conn, "show.html", auth: auth)
  end
end
