defmodule PlatformWeb.V1.BlogView do
  use PlatformWeb, :view
  def team do

  end

  def render("blog_posts.json", %{blog_posts: blog_posts}) do
    %{
      blog_posts: Enum.map(blog_posts, &blog_post_json/1)
    }
  end

  def blog_post_json(blog_post) do
    # %{
    #   categories: blog_post.categories
    # }
    blog_post
  end

  def blog_posts do
    # url = "https://medium.com/@eric_11842/latest?format=json"
    # HTTPoison.get(url)

    url = "https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fmedium.com%2Ffeed%2F/@cryptowise"
    GetMedium.Full.blog_posts(url, raw: true)
  end

  def first_img_src_in_html(html) do
    it = html
    |> Floki.find("img")
    |> Floki.attribute("src")
    |> Enum.map(fn(url) -> HTTPoison.get!(url) end)
    List.first(it)
  end

  def content do
    List.first(blog_posts()).content
    |> Floki.filter_out("h3")
    |> Floki.raw_html
  end
end
