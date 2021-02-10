defmodule PlatformWeb.V1.Users.DiscussionsController do
  use PlatformWeb, :controller
  alias Platform.Repo

  alias Platform.Users.Discussions.Thread
  alias Platform.Topics.Topic

  def show(conn, params) do
    threads = Thread.list_threads(params)
    render(conn, "index.json", threads: threads)
  end

  def index(conn, params) do
    thread = Repo.get!(Thread, 1) |> Repo.preload([:posts, :user, :topic])
    render(conn, "thread.json", thread: thread)
  end

  def create(conn, params) do
    IO.inspect(['thread', params])

    with {:ok, thread} <-
           Thread.create_for_user(
             Map.merge(
               %{
                 "user_id" => params["user_id"]
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
