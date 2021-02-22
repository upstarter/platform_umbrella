defmodule PlatformWeb.V1.Users.DiscussionsController do
  use PlatformWeb, :controller
  alias Platform.Repo
  import Ecto.Query
  alias Platform.Users.Discussions.Thread
  alias Platform.Topics.Topic
  alias PlatformWeb.V1.Users.DiscussionsView

  def index(conn, params) do
    threads = Thread.list_threads(params)
    render(conn, "index.json", threads: threads)
  end

  def by_topic(conn, params) do
    # TODO: filter by topic
    topic =
      Repo.get_by!(Topic, id: params["id"])
      |> Repo.preload(:tokens)

    threads =
      Repo.all(from(t in Thread, where: t.topic_id == ^params["id"]))
      |> Repo.preload([[posts: :user], :user, [topic: :tokens]])

    render(conn, "index.json", data: %{topic: topic, threads: threads})
  end

  # def show(conn, params) do
  #   topic = Repo.get!(Topic, params["id"]) |> Repo.preload([[threads: [:user, :posts]]])
  #   IO.inspect(['topic', topic])
  #   render(conn, "index.json", data: %{topic: topic, threads: topic.threads})
  # end

  def show(conn, params) do
    thread =
      Repo.get_by!(Thread, id: params["id"])
      |> Repo.preload([[posts: :user], :user, :topic])

    IO.inspect(['show', params, thread])
    render(conn, "index.json", data: %{thread: thread, topic: thread.topic, posts: thread.posts})
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
