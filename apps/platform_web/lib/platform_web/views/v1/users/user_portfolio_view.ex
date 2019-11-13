defmodule PlatformWeb.V1.Users.UserPortfolioView do
  use PlatformWeb, :view
  alias PlatformWeb.V1.Users.UserPortfolioView

  def render("new.json", %{user_portfolio: user_portfolio}) do
    %{data: render_one(user_portfolio, UserPortfolioView, "user_portfolio.json")}
  end

  def render("index.json", %{user_portfolios: user_portfolios}) do
    %{data: render_many(user_portfolios, UserPortfolioView, "user_portfolio.json")}
  end

  def render("show.json", %{user_portfolio: user_portfolio}) do
    %{data: render_one(user_portfolio, UserPortfolioView, "user_portfolio.json")}
  end

  def render("user_portfolio.json", %{user_portfolio: user_portfolio}) do
    %{
      user_portfolio: user_portfolio.id
    }
  end

  def render("error.json", %{user_portfolio: user_portfolio}) do
    %{error: user_portfolio}
  end
end
