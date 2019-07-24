defmodule PlatformWeb.V1.Users.ProposalsView do
  use PlatformWeb, :view
  alias PlatformWeb.ProposalView

  def render("create_for_user.json", %{proposal: proposal}) do
    %{data: render_one(proposal, ProposalView, "proposal.json")}
  end

  def render("index.json", %{proposals: proposals}) do
    %{data: render_many(proposals, ProposalView, "proposal.json")}
  end

  def render("show.json", %{proposal: proposal}) do
    %{data: render_one(proposal, ProposalView, "proposal.json")}
  end

  def render("error.json", %{proposal: proposal}) do
    %{error: 'There was a problem creating the proposal'}
  end

  def render("proposal.json", %{proposal: proposal}) do
    %{
      id: proposal.id,
      name: proposal.name,
      description: proposal.description,
      public: proposal.public
    }
  end
end
