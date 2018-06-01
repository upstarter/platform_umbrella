defmodule PlatformWeb.PageController do
  use PlatformWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end


  def research(conn, _params) do
    render conn, "research.html"
  end

  def home(conn, _params) do
    render conn, "msgtest3.html"
  end

  def privacy_policy(conn, _params) do
    render conn, "privacy_policy.html"
  end
end
