defmodule PlatformWeb.V1.Auth.SessionView do
  use PlatformWeb, :view
  alias PlatformWeb.V1.Auth.SessionView

  def render("sign_in.json", %{conn: conn}) do
    %{jwt: conn.assigns.jwt, cw_user: conn.assigns.current_user}
  end

  def render("error.json", _) do
    %{error: "Invalid email or password"}
  end
end
