defmodule PlatformWeb.V1.Auth.AuthView do
  use PlatformWeb, :view
  alias PlatformWeb.V1.Auth.AuthView

  def render("index.json", %{auths: auths}) do
    %{data: render_many(auths, AuthView, "auth.json")}
  end

  def render("show.json", %{auth: auth}) do
    %{data: render_one(auth, AuthView, "auth.json")}
  end

  def render("auth.json", %{auth: auth}) do
    %{id: auth.id, email: auth.email}
  end
end
