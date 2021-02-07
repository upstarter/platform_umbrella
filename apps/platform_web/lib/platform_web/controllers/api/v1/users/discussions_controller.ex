defmodule PlatformWeb.V1.Users.DiscussionsController do
  use PlatformWeb, :controller
  alias Platform.Users.Proposal

  def index(conn, params) do
    discussions = Discussion.list_discussions(params)
    render(conn, "index.json", discussions: discussions)
  end

  def create(conn, _discussion_params = %{"discussion" => params}) do
    with {:ok, discussion} <-
           Discussion.create_for_user(
             Map.merge(
               %{
                 "user_id" => conn.assigns.current_user.id
               },
               params
             )
           ) do
      conn |> render("discussion.json", discussion: discussion)
    else
      _ ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json", discussion: params)
    end
  end
end
