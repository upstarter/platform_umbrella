defmodule PlatformWeb.V1.Topics.TopicView do
  use PlatformWeb, :view
  alias PlatformWeb.TopicView

  def render("index.json", %{topics: topics}) do
    %{data: render_many(topics, TopicView, "topic.json")}
  end

  def render("show.json", %{topic: topic}) do
    %{data: render_one(topic, TopicView, "topic.json")}
  end

  def render("topic.json", %{topic: topic}) do
    %{
      data: topic
    }
  end
end
