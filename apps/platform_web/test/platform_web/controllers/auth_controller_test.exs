defmodule PlatformWeb.AuthControllerTest do
  use PlatformWeb.ConnCase

  alias Platform.Auth
  alias Platform.Auth.Account
  import PlatformWeb.Auth.Guardian
  import Platform.Factory

  @create_attrs %{email: "fred@cryptowise.ai", password: "password"}
  @update_attrs %{
    email: "eric@cryptowise.ai",
    password: "somepassword"
  }
  @invalid_attrs %{email: nil, password: nil}

  def fixture(:auth) do
    {:ok, auth} = Auth.create_account(@create_attrs)
    auth
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "GET /auth/login", %{conn: conn} do
    # See https://github.com/thoughtbot/ex_machina
    user = insert(:user)

    {:ok, token, _} = encode_and_sign(user, %{}, token_type: :access)

    conn =
      conn
      |> put_req_header("authorization", "bearer: " <> token)
      |> get(auth_path(conn, :me))

    # Assert things here
  end

  test "GET /auth/logout", %{conn: conn} do
    # See https://github.com/thoughtbot/ex_machina
    user = insert(:user)

    {:ok, token, _} = encode_and_sign(user, %{}, token_type: :access)

    conn =
      conn
      |> put_req_header("authorization", "bearer: " <> token)
      |> get(auth_path(conn, :me))

    # Assert things here
  end

  defp create_auth(_) do
    auth = fixture(:auth)
    {:ok, auth: auth}
  end
end
