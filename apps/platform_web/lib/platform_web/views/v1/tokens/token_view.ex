defmodule PlatformWeb.V1.Tokens.TokenView do
  use PlatformWeb, :view
  alias PlatformWeb.V1.Tokens.TokenView

  def render("index.json", %{tokens: tokens}) do
    %{data: render_many(tokens, TokenView, "token.json")}
  end

  def render("show.json", %{token: token}) do
    %{data: render_one(token, TokenView, "token.json")}
  end

  def render("token.json", %{token: token}) do
    %{
      id: token.id,
      name: token.name,
      short_desc: token.short_desc,
      ticker: token.ticker
    }
  end
end
