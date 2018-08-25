defmodule PlatformWeb.AuthControllerTest do
  use PlatformWeb.ConnCase

  alias Platform.Auth
  alias Platform.Auth.Account

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

  describe "create auth" do
    test "renders auth when data is valid", %{conn: conn} do
      conn = post(conn, auth_path(conn, :create), auth: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      IO.inspect(json_response(conn, 201)["data"])

      conn = get(conn, auth_path(conn, :show, %{"id" => id}))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "email" => "fred@cryptowise.ai"
             }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, auth_path(conn, :create), auth: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  defp create_auth(_) do
    auth = fixture(:auth)
    {:ok, auth: auth}
  end
end
