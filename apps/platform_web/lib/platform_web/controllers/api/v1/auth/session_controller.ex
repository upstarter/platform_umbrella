defmodule PlatformWeb.V1.Auth.SessionController do
  use PlatformWeb, :controller

  alias Platform.Auth
  alias Platform.Users.User
  alias Platform.Repo
  alias PlatformWeb.Auth.Guardian

  plug(:scrub_params, "session" when action in [:sign_in])

  def sign_in(conn, %{
        "session" => %{"username" => email, "password" => pass, "remember" => remember}
      }) do
    with {:ok, cred} <- Auth.find_and_confirm_password(email, pass),
         {:ok, jwt, _full_claims, _user, conn} <- authenticate(conn, cred) do
      render(conn, "sign_in.json", jwt: jwt)
    else
      _ ->
        # IO.puts(["$$$$$$$$$$$$$$$$", conn])
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json")
    end
  end

  def authenticate(conn, cred) do
    {:ok, jwt, _full_claims} = Guardian.encode_and_sign(cred, %{}, token_type: "access")

    conn = Guardian.Plug.sign_in(conn, cred)
    user = Repo.get_by(User, id: cred.user_id)

    conn = assign(conn, :current_user, user)

    {:ok, jwt, _full_claims, user, conn}
  end

  def sign_out(conn, _params) do
    with token <- Guardian.Plug.current_token(),
         {:ok, _claims} <- Guardian.revoke(token),
         do: render(conn, "sign_out.json", [])
  end

  def create(conn, %{"session" => session_params}) do
    case PlatformWeb.Auth.Session.authenticate(session_params) do
      {:ok, user} ->
        {:ok, jwt, _full_claims} =
          user
          |> Guardian.encode_and_sign(:token)

        conn
        |> put_status(:created)
        |> render("show.json", jwt: jwt, user: user)

      :error ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json")
    end
  end

  def unauthenticated(conn, _params) do
    conn
    |> put_status(:forbidden)
    |> render(PlatformWeb.SessionView, "forbidden.json", error: "Not Authenticated!")
  end
end
