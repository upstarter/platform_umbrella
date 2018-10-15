defmodule PlatformWeb.V1.Auth.SessionController do
  use PlatformWeb, :controller

  alias Platform.Auth
  alias Platform.Auth.Account
  alias Platform.Auth.TokenSerializer
  alias Platform.Repo

  plug(:scrub_params, "auth" when action in [:sign_in])

  def sign_in(conn, %{"auth" => %{"email" => email, "password" => pass}}) do
    with {:ok, auth} <- Auth.find_and_confirm_password(email, pass),
         {:ok, jwt, _full_claims} <-
           TokenSerializer.encode_and_sign(auth, %{}, token_type: "access"),
         do: render(conn, "sign_in.json", auth: auth, jwt: jwt)
  end

  def sign_out(conn, _params) do
    with token <- Guardian.Plug.current_token(),
         {:ok, _claims} <- TokenSerializer.revoke(token),
         do: render(conn, "sign_out.json", [])
  end

  def create(conn, %{"session" => session_params}) do
    case PhoenixPair.Session.authenticate(session_params) do
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
