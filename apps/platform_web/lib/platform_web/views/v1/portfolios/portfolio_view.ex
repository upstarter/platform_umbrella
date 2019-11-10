defmodule PlatformWeb.V1.Portfolios.PortfolioView do
  use PlatformWeb, :view
  alias PlatformWeb.V1.Portfolios.PortfolioView

  def render("new.json", %{portfolio: portfolio}) do
    %{data: render_one(portfolio, PortfolioView, "portfolio.json")}
  end

  def render("index.json", %{portfolios: portfolios}) do
    %{data: render_many(portfolios, PortfolioView, "portfolio.json")}
  end

  def render("show.json", %{portfolio: portfolio}) do
    %{data: render_one(portfolio, PortfolioView, "portfolio.json")}
  end

  def render("portfolio.json", %{portfolio: portfolio}) do
    %{
      portfolio: portfolio.id
    }
  end

  def render("error.json", %{portfolio: portfolio}) do
    %{error: portfolio}
  end
end
