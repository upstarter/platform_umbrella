defmodule PlatformWeb.V1.Auth.SessionController do
  use PlatformWeb, :controller

  alias Platform.Auth
  alias Platform.Users.User
  alias Platform.Repo
  alias PlatformWeb.Auth.Guardian

  plug(:scrub_params, "session" when action in [:sign_in])
  # A common use case for many api's that are consumed by mobile app's is to get a
  # new token without re-authenticating to avoid contentiously prompt users with
  # login screens. This is most commonly done with refresh tokens. Would it be an
  # idea to make a project similar to GuardianDb to implement this behavior?
  # Guardian provides a refresh! function. Checkout Guardian.refresh!
  #
  # Yes, I know but that only allows us to make a new token from an valid existing
  # one. The feature I am requesting is to create a new token without having a valid
  # token, but from a refresh token. Like described here
  # https://auth0.com/docs/refresh-token
  #
  # You can use encode_and_sign to create tokens with a 'refresh type' and a longer expire time.
  #
  # claims = Guardian.Claims.app_claims |> Guardian.Claims.ttl({60, :days})
  # {:ok, jwt, claims} = Guardian.encode_and_sign(resource, "refresh", claims)
  #
  # Later you can verify that a token is a 'refresh token' and issue a shorter living access token.
  # case Guardian.decode_and_verify(jwt) do
  # { :ok, claims } -> # verify that the type is refresh and issue a new access token
  # end

  # My solution is something like this...
  #
  # In the login endpoint i respond with 2 tokens (access and refresh) ...
  #
  # new_conn =
  #   MyProj.Guardian.Plug.sign_in(
  #     conn,
  #     user,
  #     %{},
  #     token_type: "refresh"
  #   )
  #
  # jwt_refresh = Guardian.Plug.current_token(new_conn)
  #
  # {:ok, _old_stuff, {jwt, %{"exp" => exp} = _new_claims}} =
  #     Guardian.exchange(jwt_refresh, "refresh", "access")
  # Basically the solution is to use the Guardian.exchange(...)
  #
  # In the refresh endpoint i respond with the new access token ...

  # long lived cookie refresh token used when short-lived access token expires
  # to avoid user having to login, when access token expires, client calls here
  # for new access token, and then can access resource
  def refresh(conn, %{"jwt_refresh" => jwt_refresh}) do
    case Guardian.exchange(jwt_refresh, "refresh", "access") do
      {:ok, _old_stuff, {jwt, %{"exp" => _exp} = _new_claims}} ->
        conn
        |> put_session("_cw_rem", jwt)
        |> render("refresh.json", %{jwt: jwt})

      {:error, _reason} ->
        conn
        |> put_status(:unauthorized)
        |> Error.render(:invalid_credentials)
    end
  end

  def sign_in(
        conn,
        session = %{
          "session" => %{"email" => _email, "password" => _pass, "remember" => _remember}
        }
      ) do
    with {:ok, cred} <- Auth.new_session(session),
         {:ok, conn} <- authenticate(conn, cred) do
      render(conn, "sign_in.json")
    else
      _ ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json")
    end
  end

  def authenticate(conn, cred) do
    user = Repo.get_by(User, id: cred.user_id)

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

    # thirty days
    # 4 * 7 * 24 * 60 * 60
    max_age = 60 * 25

    conn =
      conn
      |> put_resp_cookie("_cw_csrf", get_csrf_token(),
        max_age: max_age,
        http_only: false,
        secure: false,
        same_site: :strict
      )
      |> put_resp_cookie("_cw_acc", jwt,
        max_age: max_age,
        http_only: false,
        secure: false
      )

    {:ok, conn}
  end

  def sign_out(conn, _params) do
    with token <- Guardian.Plug.current_token(conn),
         {:ok, _claims} <- Guardian.revoke(token),
         conn <- Guardian.Plug.sign_out(conn) do
      render(conn, "sign_out.json")
    end
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
