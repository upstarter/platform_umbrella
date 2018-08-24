defmodule PlatformWeb.V1.Users.UserView do
  use PlatformWeb, :view
  alias PlatformWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id, user_id: user.user_id, name: user.name, desc: user.desc}
  end
end
