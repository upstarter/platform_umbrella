defmodule PlatformWeb.V1.Providers.PortfolioController do
  use PlatformWeb, :controller

  def index(conn, _params) do
    tokens = Platform.Tokens.Asset.portfolio()
    render(conn, "index.json", tokens: tokens)
  end
end
