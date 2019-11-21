defmodule PlatformWeb.V1.Users.UsersController do
  use PlatformWeb, :controller
  alias Platform.Repo

  alias Platform.Users
  alias Platform.Users.{User, Profiles}
  alias Profiles.Role

  # action_fallback(PlatformWeb.FallbackController)

  def index(conn, _params) do
    users = Users.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <-
           Users.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"user" => user_params}) do
    user = Repo.get!(User, user_params["id"])

    with {:ok, %User{} = user} <-
           Users.update_user_roles(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def update_role(conn, %{
        "role" => %{"is_role" => is_role, "role" => role, "user_id" => user_id}
      }) do
    user = Repo.get_by!(User, id: user_id) |> Repo.preload(:roles)

    with {:ok, %User{} = user} <- Users.update_role(user, role, is_role) do
      render(conn, "roles.json", user: user)
    end
  end

  def roles(conn, _params) do
    user = Users.roles(conn.assigns.current_user)

    render(conn, "roles.json", user: user)
  end

  def delete(conn, %{"id" => id}) do
    user = Users.get_user!(id)

    with {:ok, %User{}} <- Users.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
