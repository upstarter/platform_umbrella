defmodule PlatformWeb.V1.Providers.PortfolioController do
  use PlatformWeb, :controller

  def assets(conn, _params) do
    render conn, tokens: Platform.Asset.portfolio
  end
end
