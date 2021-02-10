defmodule PlatformWeb.V1.Users.PostsView do
  use PlatformWeb, :view

  def render("create_for_user.json", %{post: post}) do
    %{data: render_one(post, __MODULE__, "post.json")}
  end

  def render("index.json", %{posts: posts}) do
    IO.inspect(['posts', posts])

    %{data: render_many(posts, __MODULE__, "post.json", as: :post)}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, __MODULE__, "post.json", as: :post)}
  end

  def render("error.json", %{post: _post}) do
    %{error: "There was a problem creating the post"}
  end

  def render("post.json", %{post: post}) do
    %{
      id: post.id,
      title: post.title,
      description: post.description,
      public: post.is_public,
      type: post.type
    }
  end
end
