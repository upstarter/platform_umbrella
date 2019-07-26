defmodule PlatformWeb.V1.Auth.SessionController do
  use PlatformWeb, :controller

  alias Platform.Auth
  alias Platform.Users.User
  alias Platform.Repo
  alias PlatformWeb.Auth.Guardian

  plug(:scrub_params, "session" when action in [:sign_in])

  #   But you can use encode_and_sign to create tokens with a 'refresh type' and a longer expire time.
  #
  # claims = Guardian.Claims.app_claims |> Guardian.Claims.ttl({60, :days})
  # {:ok, jwt, claims} = Guardian.encode_and_sign(resource, "refresh", claims)
  #
  # Later you can verify that a token is a 'refresh token' and issue a shorter living access token.
  # case Guardian.decode_and_verify(jwt) do
  # { :ok, claims } -> #verify that the type is refresh and issue a new access token
  # end

  #   My solution is something like this...
  #
  # In the login endpoint i respond with 2 tokens (access and refresh) ...
  #
  # new_conn =
  #   MyProj.Guardian.Plug.sign_in(
  #     conn,
  #     credentials,
  #     %{},
  #     token_type: "refresh"
  #   )
  #
  # jwt_refresh = MyProj.Guardian.Plug.current_token(new_conn)
  #
  # {:ok, _old_stuff, {jwt, %{"exp" => exp} = _new_claims}} =
  #   MyProj.Guardian.exchange(jwt_refresh, "refresh", "access")
  # Basically the solution is to use the MyProj.Guardian.exchange(...)
  #
  # In the refresh endpoint i respond with the new access token ...
  #
  # def refresh(conn, %{"jwt_refresh" => jwt_refresh}) do
  # case MyProj.Guardian.exchange(jwt_refresh, "refresh", "access") do
  #   {:ok, _old_stuff, {jwt, %{"exp" => exp} = _new_claims}} ->
  #     conn
  #     |> put_resp_header("authorization", "Bearer #{jwt}")
  #     |> put_resp_header("x-expires", "#{exp}")
  #     |> render(MyProjWeb.AuthenticationView, "refresh.json", %{jwt: jwt})
  #
  #   {:error, _reason} ->
  #     conn
  #     |> put_status(:unauthorized)
  #     |> Error.render(:invalid_credentials)
  # end

  def sign_in(
        conn,
        session = %{
          "session" => %{"username" => _email, "password" => _pass, "remember" => _remember}
        }
      ) do
    with {:ok, cred} <- Auth.new_session(session),
         {:ok, jwt, _full_claims, _user, conn} <- authenticate(conn, cred) do
      render(conn, "sign_in.json", jwt: jwt)
    else
      _ ->
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
