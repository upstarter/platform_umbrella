defmodule PlatformWeb.V1.Users.PostsView do
  use PlatformWeb, :view

  def render("create_for_user.json", %{post: post}) do
    %{data: render_one(post, __MODULE__, "post.json")}
  end

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, __MODULE__, "post.json", as: :post)}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, __MODULE__, "post.json", as: :post)}
  end

  def render("error.json", %{post: _post}) do
    %{error: "There was a problem creating the post"}
  end

  def render("user.json", %{user: user}) do
    user.nickname
  end

  def render("post.json", %{post: post}) do
    %{
      id: post.id,
      title: post.title,
      body: post.body,
      description: post.description,
      public: post.is_public,
      since_posted: post.inserted_at,
      type: post.type,
      user: render_one(post.user, __MODULE__, "user.json", as: :user)
    }
  end
end
