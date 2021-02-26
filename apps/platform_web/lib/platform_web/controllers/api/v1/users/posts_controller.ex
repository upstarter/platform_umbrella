defmodule PlatformWeb.V1.Users.PostsController do
  use PlatformWeb, :controller
  alias Platform.Repo

  alias Platform.Users.Discussions.Thread
  alias Platform.Users.Discussions.Post
  alias Platform.Topics.Topic

  def show(conn, params) do
    posts = Thread.list_threads(params)
    render(conn, "index.json", posts: posts)
  end

  def index(conn, params) do
    post = Repo.get!(Post, 1) |> Repo.preload([:posts, :user, :topic])
    render(conn, "post.json", post: post)
  end

  def create(conn, params) do
    with {:ok, post} <-
           Post.create_for_user(
             Map.merge(
               %{
                 "user_id" => params["user_id"],
                 "thread_id" => params["thread_id"],
                 "parent_id" => params["parent_id"]
               },
               params
             )
           ) do
      conn |> render("post.json", post: post)
    else
      _ ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json", post: params)
    end
  end
end
