defmodule PlatformWeb.V1.Users.DiscussionsController do
  use PlatformWeb, :controller
  alias Platform.Repo

  alias Platform.Users.Discussions.Thread
  alias Platform.Topics.Topic

  def index(conn, params) do
    threads = Thread.list_threads(params)
    render(conn, "index.json", threads: threads)
  end

  def show(conn, %{"id" => id, "topic_id" => topic_id}) do
    thread = Repo.get!(Thread, 1) |> Repo.preload([:topic])
    render(conn, "show.json", thread: thread)
  end

  def create(conn, _thread_params = %{"thread" => params}) do
    with {:ok, thread} <-
           Thread.create_for_user(
             Map.merge(
               %{
                 "user_id" => conn.assigns.current_user.id
               },
               params
             )
           ) do
      conn |> render("thread.json", thread: thread)
    else
      _ ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json", thread: params)
    end
  end
end
