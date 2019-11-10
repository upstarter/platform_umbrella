defmodule PlatformWeb.V1.Users.UserProfileControllerTest do
  use PlatformWeb.ConnCase

  alias Platform.Users.Profiles
  alias Platform.Users.Profiles.UserProfile

  @create_attrs %{
    role: "some role"
  }
  @update_attrs %{
    role: "some updated role"
  }
  @invalid_attrs %{role: nil}

  def fixture(:user_profile) do
    {:ok, user_profile} = UserProfiles.create_user_profile(@create_attrs)
    user_profile
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all user_profiles", %{conn: conn} do
      conn = get(conn, Routes.user_profile_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user_profile" do
    test "renders user_profile when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_profile_path(conn, :create), user_profile: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.user_profile_path(conn, :show, id))

      assert %{
               "id" => id,
               "role" => "some role"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_profile_path(conn, :create), user_profile: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user_profile" do
    setup [:create_user_profile]

    test "renders user_profile when data is valid", %{
      conn: conn,
      user_profile: %UserProfile{id: id} = user_profile
    } do
      conn =
        put(conn, Routes.user_profile_path(conn, :update, user_profile),
          user_profile: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.user_profile_path(conn, :show, id))

      assert %{
               "id" => id,
               "role" => "some updated role"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user_profile: user_profile} do
      conn =
        put(conn, Routes.user_profile_path(conn, :update, user_profile),
          user_profile: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user_profile" do
    setup [:create_user_profile]

    test "deletes chosen user_profile", %{conn: conn, user_profile: user_profile} do
      conn = delete(conn, Routes.user_profile_path(conn, :delete, user_profile))
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, Routes.user_profile_path(conn, :show, user_profile))
      end)
    end
  end

  defp create_user_profile(_) do
    user_profile = fixture(:user_profile)
    {:ok, user_profile: user_profile}
  end
end
