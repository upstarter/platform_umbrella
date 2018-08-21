defmodule PlatformWeb.PortfolioView do
  use PlatformWeb, :view
  alias PlatformWeb.PortfolioView

  def render("index.json", %{portfolios: portfolios}) do
    %{data: render_many(portfolios, PortfolioView, "portfolio.json")}
  end

  def render("show.json", %{portfolio: portfolio}) do
    %{data: render_one(portfolio, PortfolioView, "portfolio.json")}
  end

  def render("portfolio.json", %{portfolio: portfolio}) do
    %{id: portfolio.id,
      name: portfolio.name,
      short_desc: portfolio.short_desc,
      long_desc: portfolio.long_desc}
  end
end
