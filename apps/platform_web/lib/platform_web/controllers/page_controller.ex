defmodule PlatformWeb.PageController do
  use PlatformWeb, :controller

  def home(conn, _params) do
    render conn, "home.html"
  end

  def test(conn, _params) do
    render conn, "test.html"
  end

  def index(conn, _params) do
    render conn, "index.html"
  end

  def research(conn, _params) do
    render conn, "research.html"
  end

  def blog(conn, _params) do
    render conn, "blog.html"
  end

  def press(conn, _params) do
    render conn, "press.html"
  end

  def privacy_policy(conn, _params) do
    render conn, "privacy_policy.html"
  end
end
