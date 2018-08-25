defmodule PlatformWeb.V1.Auth.SessionController do
  use PlatformWeb, :controller

  alias Platform.Auth.Account

  plug(:scrub_params, "auth" when action in [:sign_in])

  def sign_in(conn, %{"auth" => %{"email" => email, "password" => pass}}) do
    with {:ok, auth} <- Platform.Auth.find_and_confirm_password(email, pass),
         {:ok, jwt, _full_claims} <-
           Platform.Auth.TokenSerializer.encode_and_sign(auth, %{}, token_type: "access"),
         do: render(conn, "sign_in.json", auth: auth, jwt: jwt)
  end

  def sign_out(conn, _params) do
    with token <- Guardian.Plug.current_token(),
         {:ok, _claims} <- Platform.Auth.TokenSerializer.revoke(token),
         do: render(conn, "sign_out.json", [])
  end
end
