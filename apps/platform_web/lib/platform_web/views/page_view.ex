defmodule PlatformWeb.PageView do
  use PlatformWeb, :view

  def blog_posts do
    ConCache.get_or_store(:wise_cache, "blogPosts", fn() ->
      url = "https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fmedium.com%2Ffeed%2F/@cryptowise"
      GetMedium.Truncated.blog_posts(url, raw: true)
    end)
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
