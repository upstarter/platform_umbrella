defmodule PlatformWeb.V1.Users.UserProfileView do
  use PlatformWeb, :view
  alias PlatformWeb.Users.UserProfileView

  def render("index.json", %{user_profiles: user_profiles}) do
    %{data: render_many(user_profiles, UserProfileView, "user_profile.json")}
  end

  def render("show.json", %{user_profile: user_profile}) do
    %{data: render_one(user_profile, UserProfileView, "user_profile.json")}
  end

  def render("user_profile.json", %{user_profile: user_profile}) do
    %{id: user_profile.id, role: user_profile.role}
  end
end
