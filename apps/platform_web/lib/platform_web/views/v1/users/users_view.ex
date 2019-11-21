defmodule PlatformWeb.V1.Users.UsersView do
  use PlatformWeb, :view
  alias PlatformWeb.V1.Users.UsersView

  def render("index.json", %{user: user}) do
    %{data: render_many(user, UsersView, "user.json")}
  end

  def render("roles.json", %{user: user}) do
    roles = user.roles |> Enum.map(& &1.title)
    %{data: %{id: user.id, roles: roles}}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UsersView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id}
  end
end
