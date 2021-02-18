defmodule PlatformWeb.V1.Users.DiscussionsController do
  use PlatformWeb, :controller
  alias Platform.Repo

  alias Platform.Users.Discussions.Thread
  alias Platform.Topics.Topic
  alias PlatformWeb.V1.Users.DiscussionsView

  def index(conn, params) do
    threads = Thread.list_threads(params)
    render(conn, "index.json", threads: threads)
  end

  def by_topic(conn, params) do
    # TODO: filter by topic
    thread =
      Repo.get_by!(Thread, topic_id: params["topic_id"]) |> Repo.preload([:posts, :user, :topic])

    render(conn, "thread.json", thread: thread)
  end

  def show(conn, params) do
    thread = Repo.get!(Thread, 1) |> Repo.preload([[posts: :user], :user, :topic])
    IO.inspect(['thread9s', thread])
    render(conn, "thread.json", thread: thread)
  end

  def create(conn, params) do
    IO.inspect(['thread', params])

    with {:ok, thread} <-
           Thread.create_for_user(
             Map.merge(
               %{
                 "user_id" => params["user_id"],
                 "topic_id" => params["topic_id"]
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
