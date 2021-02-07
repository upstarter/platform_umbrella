defmodule PlatformWeb.V1.Users.DiscussionsView do
  use PlatformWeb, :view
  alias PlatformWeb.V1.Users.DiscussionsView

  def render("create_for_user.json", %{thread: thread}) do
    %{data: render_one(thread, __MODULE__, "thread.json")}
  end

  def render("index.json", %{threads: threads}) do
    %{data: render_many(threads, __MODULE__, "thread.json", as: :thread)}
  end

  def render("show.json", %{thread: thread}) do
    %{data: render_one(thread, __MODULE__, "thread.json", as: :thread)}
  end

  def render("error.json", %{thread: _thread}) do
    %{error: "There was a problem creating the thread"}
  end

  def render("thread.json", %{thread: thread}) do
    %{
      title: thread.title,
      description: thread.description,
      public: thread.is_public,
      type: thread.type,
      topic: thread.topic
    }
  end
end
