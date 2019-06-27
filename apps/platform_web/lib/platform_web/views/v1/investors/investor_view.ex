defmodule PlatformWeb.V1.Investors.InvestorView do
  use PlatformWeb, :view
  alias PlatformWeb.InvestorView

  def render("index.json", %{investors: investors}) do
    %{data: render_many(investors, InvestorView, "investor.json")}
  end

  def render("show.json", %{investor: investor}) do
    %{data: render_one(investor, InvestorView, "investor.json")}
  end

  def render("investor.json", %{investor: investor}) do
    %{
      id: investor.id,
      account_id: investor.account_id,
      name: investor.name,
      desc: investor.desc
    }
  end
end
