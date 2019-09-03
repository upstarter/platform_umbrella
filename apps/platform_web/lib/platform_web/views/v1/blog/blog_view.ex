defmodule PlatformWeb.V1.BlogView do
  use PlatformWeb, :view
  alias PlatformWeb.V1.BlogView

  def render("index.json", %{blog_posts: blog_posts}) do
    # %{data: render_many(blog_posts, BlogView, "blog.json")}
    %{blog_posts: blog_posts}
  end

  def render("show.json", %{blog_posts: blog}) do
    %{data: render_one(blog, BlogView, "blog.json")}
  end

  def render("blog.json", %{blog_posts: blog}) do
    %{data: %{blog_posts: blog}}
  end

  def blog_posts do
    ConCache.get_or_store(:wise_cache, "blogPosts", fn ->
      url =
        "https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fmedium.com%2Ffeed%2F/@cryptowise"

      GetMedium.Truncated.blog_posts(url, raw: true)
    end)
  end

  def first_img_src_in_html(html) do
    it =
      html
      |> Floki.find("img")
      |> Floki.attribute("src")
      |> Enum.map(fn url -> HTTPoison.get!(url) end)

    List.first(it)
  end

  def content do
    List.first(blog_posts()).content
    |> Floki.filter_out("h3")
    |> Floki.raw_html()
  end
end
