defmodule PlatformWeb.V1.Auth.SessionView do
  use PlatformWeb, :view
  alias PlatformWeb.V1.Auth.SessionView

  def render("sign_in.json", %{conn: conn}) do
    %{ok: "Signed In"}
  end

  def render("sign_out.json", %{conn: conn}) do
    %{ok: "Signed Out"}
  end

  def render("not_found.json", %{conn: conn}) do
    %{error: "Token Not Found"}
  end

  def render("error.json", %{conn: conn}) do
    %{error: conn.cookies}
  end
end
