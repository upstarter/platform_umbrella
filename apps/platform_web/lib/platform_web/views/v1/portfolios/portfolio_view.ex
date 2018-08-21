defmodule PlatformWeb.V1.PortfolioView do
  use PlatformWeb, :view

  def render("index.json", %{tokens: tokens}) do
    %{
      tokens: Enum.map(tokens, &token_json/1)
    }
  end

  def token_json(token) do
    %{
      ticker: token.ticker,
      name: token.name,
      description: token.desc,
      img: token.img
    }
  end
end
