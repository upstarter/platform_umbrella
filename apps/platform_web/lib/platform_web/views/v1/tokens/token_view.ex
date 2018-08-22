defmodule PlatformWeb.V1.TokenView do
  use PlatformWeb, :view
  alias PlatformWeb.TokenView

  def render("index.json", %{tokens: tokens}) do
    %{data: render_many(tokens, TokenView, "token.json")}
  end

  def render("show.json", %{token: token}) do
    %{data: render_one(token, TokenView, "token.json")}
  end

  def render("token.json", %{token: token}) do
    %{id: token.id, name: token.name, short_desc: token.short_desc, long_desc: token.long_desc}
  end
end
