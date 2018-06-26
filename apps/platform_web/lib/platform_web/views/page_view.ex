defmodule PlatformWeb.PageView do
  use PlatformWeb, :view

  def team do
    
  end

  def blog_posts do
    # url = "https://medium.com/@eric_11842/latest?format=json"
    # HTTPoison.get(url)

    url = "https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fmedium.com%2Ffeed%2F/@eric_11842"
    GetMedium.Full.blog_posts(url, raw: true)
  end

  def first_img_src_in_html(html) do
    it = html
    |> Floki.find("img")
    |> Floki.attribute("src")
    |> Enum.map(fn(url) -> HTTPoison.get!(url) end)
    List.first(it)
  end

end
