defmodule PlatformWeb.V1.Auth.SessionView do
  use PlatformWeb, :view
  alias PlatformWeb.V1.Auth.SessionView

  def render("sign_in.json", %{conn: conn}) do
    %{ok: "Signed In"}
  end

  def render("sign_out.json", %{conn: conn}) do
    %{ok: conn.cookies}
  end

  def render("error.json", _) do
    %{error: "Invalid email or password"}
  end
end
