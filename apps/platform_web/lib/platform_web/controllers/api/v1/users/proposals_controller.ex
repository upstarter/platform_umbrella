defmodule PlatformWeb.V1.Users.ProposalsController do
  use PlatformWeb, :controller
  alias Platform.Users.Proposal

  def index(conn, params) do
    proposals = Proposal.list_proposals(params)
    render(conn, "index.json", proposals: proposals)
  end

  def create(conn, _proposal_params = %{"proposal" => params}) do
    with {:ok, %{} = proposal} <-
           Proposal.create_for_user(
             Map.merge(
               %{
                 "user_id" => conn.assigns.current_user.id
               },
               params
             )
           ) do
      conn |> render("proposal.json", proposal: proposal)
    else
      _ ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json", proposal: params)
    end
  end
end
