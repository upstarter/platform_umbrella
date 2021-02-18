defmodule PlatformWeb.V1.Users.DiscussionsView do
  use PlatformWeb, :view
  alias PlatformWeb.V1.Users.DiscussionsView
  alias PlatformWeb.V1.Users.PostsView

  def render("create_for_user.json", %{thread: thread}) do
    %{data: render_one(thread, __MODULE__, "thread.json")}
  end

  def render("thread_with_posts.json", %{thread: thread}) do
    %{
      thread: render_one(thread, __MODULE__, 'thread.json')
    }
  end

  def render("index.json", %{threads: threads}) do
    %{data: render_many(threads, __MODULE__, "thread.json", as: :thread)}
  end

  def render("show.json", %{thread: thread}) do
    %{data: render_one(thread, __MODULE__, "thread.json", as: :thread)}
  end

  def render("error.json", %{thread: _thread}) do
    %{error: "There was a problem creating the thread"}
  end

  def render("user.json", %{user: user}) do
    user.nickname
  end

  def render("thread.json", %{thread: thread}) do
    %{
      id: thread.id,
      title: thread.title,
      description: thread.description,
      public: thread.is_public,
      user: render_one(thread.user, __MODULE__, "user.json", as: :user),
      posts: render_many(thread.posts, PostsView, "post.json", as: :post),
      type: thread.type,
      topic: thread.topic
    }
  end
end
