defmodule PlatformWeb.V1.Users.ProposalsController do
  use PlatformWeb, :controller
  alias Platform.Users.Proposal

  def index(conn, _params) do
    proposals = Proposal.list_proposals()
    render(conn, "index.json", proposals: proposals)
  end

  def create(conn, _proposal_params = %{"proposal" => params}) do
    IO.inspect(['cerat', params])

    with {:ok, %{} = proposal_info} <- Proposal.create_for_user(params) do
      conn |> render("proposal.json", proposal: proposal_info)
    else
      _ ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json", proposal: params)
    end
  end
end
