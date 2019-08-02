defmodule PlatformWeb.V1.BlogController do
  use PlatformWeb, :controller

  def blog_posts(conn, _params) do
    render(conn, blog_posts: PlatformWeb.PageView.blog_posts())
  end
end
