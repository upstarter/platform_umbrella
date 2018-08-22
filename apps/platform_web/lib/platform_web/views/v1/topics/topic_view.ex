defmodule PlatformWeb.V1.TopicView do
  use PlatformWeb, :view
  alias PlatformWeb.TopicView

  def render("index.json", %{topics: topics}) do
    %{data: render_many(topics, TopicView, "topic.json")}
  end

  def render("show.json", %{topic: topic}) do
    %{data: render_one(topic, TopicView, "topic.json")}
  end

  def render("topic.json", %{topic: topic}) do
    %{id: topic.id, name: topic.name, short_desc: topic.short_desc, long_desc: topic.long_desc}
  end
end
