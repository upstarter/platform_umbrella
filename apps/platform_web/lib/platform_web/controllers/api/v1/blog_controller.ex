defmodule PlatformWeb.V1.BlogController do
  use PlatformWeb, :controller

  def blog_posts(conn, _params) do
    IO.inspect(conn)
    render(conn, "index.json", blog_posts: PlatformWeb.V1.BlogView.blog_posts())
  end
end
