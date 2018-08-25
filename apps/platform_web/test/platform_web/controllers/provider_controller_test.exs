defmodule PlatformWeb.ProviderControllerTest do
  use PlatformWeb.ConnCase

  alias Platform.Providers
  alias Platform.Providers.Provider

  @create_attrs %{desc: "some desc", name: "some name", auth_account_id: 42}
  @update_attrs %{desc: "some updated desc", name: "some updated name", auth_account_id: 43}
  @invalid_attrs %{desc: nil, name: nil, auth_account_id: nil}

  def fixture(:provider) do
    {:ok, provider} = Providers.create_provider(@create_attrs)
    provider
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all providers", %{conn: conn} do
      conn = get(conn, provider_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create provider" do
    test "renders provider when data is valid", %{conn: conn} do
      conn = post(conn, provider_path(conn, :create), provider: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, provider_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "desc" => "some desc",
               "name" => "some name",
               "auth_account_id" => 42
             }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, provider_path(conn, :create), provider: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update provider" do
    setup [:create_provider]

    test "renders provider when data is valid", %{
      conn: conn,
      provider: %Provider{id: id} = provider
    } do
      conn = put(conn, provider_path(conn, :update, provider), provider: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, provider_path(conn, :show, id))

      assert json_response(conn, 200)["data"] == %{
               "id" => id,
               "desc" => "some updated desc",
               "name" => "some updated name",
               "auth_account_id" => 43
             }
    end

    test "renders errors when data is invalid", %{conn: conn, provider: provider} do
      conn = put(conn, provider_path(conn, :update, provider), provider: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete provider" do
    setup [:create_provider]

    test "deletes chosen provider", %{conn: conn, provider: provider} do
      conn = delete(conn, provider_path(conn, :delete, provider))
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, provider_path(conn, :show, provider))
      end)
    end
  end

  defp create_provider(_) do
    provider = fixture(:provider)
    {:ok, provider: provider}
  end
end
