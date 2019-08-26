defmodule PlatformWeb.V1.Users.ProposalsView do
  use PlatformWeb, :view
  alias PlatformWeb.V1.Users.ProposalsView

  def render("create_for_user.json", %{proposal: proposal}) do
    %{data: render_one(proposal, __MODULE__, "proposal.json")}
  end

  def render("index.json", %{proposals: proposals}) do
    %{data: render_many(proposals, __MODULE__, "proposal.json", as: :proposal)}
  end

  def render("show.json", %{proposal: proposal}) do
    %{data: render_one(proposal, __MODULE__, "proposal.json")}
  end

  def render("error.json", %{proposal: _proposal}) do
    %{error: "There was a problem creating the proposal"}
  end

  def render("proposal.json", %{proposal: proposal}) do
    %{
      name: proposal.title,
      user_name: proposal.user.nickname,
      description: proposal.description,
      public: proposal.is_public,
      type: proposal.type
    }
  end
end
