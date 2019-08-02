defmodule PlatformWeb.RegistrationControllerTest do
  use PlatformWeb.ConnCase

  alias Platform.Auth
  import PlatformWeb.Auth.Guardian
  import Platform.Factory

  @create_attrs %{
    email: "fred@cryptowise.ai",
    password: "password",
    topic_knowledge_ids: [111, 114]
  }
  @update_attrs %{
    email: "eric@cryptowise.ai",
    password: "somepassword"
  }
  @invalid_attrs %{email: nil, password: nil}

  def fixture(:auth) do
    {:ok, auth} = Auth.create(@create_attrs)
    auth
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create auth" do
    test "renders auth when data is valid", %{conn: conn} do
      conn = post(conn, registration_path(conn, :create), auth: @create_attrs)

      assert %{"jwt" => jwt} = json_response(conn, 201)

      IO.inspect(json_response(conn, 201))

      conn = get(conn, registration_path(conn, :show, %{"jwt" => jwt}))

      assert json_response(conn, 200) == %{
               "jwt" => jwt
             }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, registration_path(conn, :create), auth: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  defp create_auth(_) do
    auth = fixture(:auth)
    {:ok, auth: auth}
  end
end
