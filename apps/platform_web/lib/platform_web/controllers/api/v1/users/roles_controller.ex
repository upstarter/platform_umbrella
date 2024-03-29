defmodule PlatformWeb.V1.Users.RolesController do
  use PlatformWeb, :controller
  alias Platform.Repo

  alias Platform.Users.{User, Profiles}
  alias Profiles.Role
  alias Profiles.Roles

  # action_fallback(PlatformWeb.FallbackController)

  def index(conn, _params) do
    roles = Roles.list_roles()
    render(conn, "index.json", roles: roles)
  end

  def create(conn, %{"role" => role_params}) do
    with {:ok, %Role{} = role} <-
           Roles.create_role(role_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.role_path(conn, :show, role))
      |> render("show.json", role: role)
    end
  end

  def show(conn, %{"id" => id}) do
    role = Roles.get_role!(id)
    render(conn, "show.json", role: role)
  end

  def update(conn, %{"role" => role_params}) do
    role = Repo.get_by!(UserRole, role_params["id"])

    with {:ok, %Role{} = role} <-
           Roles.update_role(role, role_params) do
      render(conn, "show.json", role: role)
    end
  end

  def delete(conn, %{"id" => id}) do
    role = Roles.get_role!(id)

    with {:ok, %Role{}} <- Roles.delete_role(role) do
      send_resp(conn, :no_content, "")
    end
  end
end
