defmodule PlatformWeb.V1.Users.DiscussionsView do
  use PlatformWeb, :view
  alias PlatformWeb.V1.Users.DiscussionsView
  alias PlatformWeb.V1.Topics.TopicView
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

  def render("index.json", %{data: %{topic: topic, threads: threads}}) do
    %{
      data: %{
        topic: render_one(topic, __MODULE__, "topic.json", as: :topic),
        threads: render_many(threads, __MODULE__, "thread.json", as: :thread)
      }
    }
  end

  def render("index.json", %{data: %{thread: thread, topic: topic, posts: posts}}) do
    %{
      data: %{
        thread: render_one(thread, __MODULE__, "thread.json", as: :thread),
        topic: render_one(topic, __MODULE__, "topic.json", as: :topic),
        posts: render_many(posts, __MODULE__, "post.json", as: :post)
      }
    }
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

  def render("topic.json", %{topic: topic}) do
    %{id: topic.id, name: topic.name, tokens: topic.tokens}
  end

  def render("post.json", %{post: post}) do
    %{
      id: post.id,
      body: post.body,
      since_posted: post.inserted_at,
      user: render_one(post.user, __MODULE__, "user.json", as: :user)
    }
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
      topic: render_one(thread.topic, __MODULE__, "topic.json", as: :topic)
    }
  end
end
