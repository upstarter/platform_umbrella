defmodule PlatformWeb.V1.Topics.TopicView do
  use PlatformWeb, :view
  alias PlatformWeb.V1.Topics.TopicView

  def render("tree.json", %{topics: topics}) do
    IO.inspect(topics)
    %{data: topics}
  end

  def render("analysis.json", %{topics: topics}) do
    IO.inspect(topics)
    %{data: topics}
  end

  def render("economics.json", %{topics: topics}) do
    IO.inspect(topics)
    %{data: topics}
  end

  def render("research.json", %{topics: topics}) do
    IO.inspect(topics)
    %{data: topics}
  end

  def render("taxonomy.json", %{topics: topics}) do
    IO.inspect(topics)
    %{data: topics}
  end

  def render("valuation.json", %{topics: topics}) do
    IO.inspect(topics)
    %{data: topics}
  end

  def render("strategy.json", %{topics: topics}) do
    IO.inspect(topics)

    %{data: topics}
  end

  def render("index.json", %{topics: topics}) do
    %{data: render_many(topics, __MODULE__, "topic.json", as: :topic)}
  end

  def render("show.json", %{topic: topic}) do
    %{data: render_one(topic, TopicView, "topic.json")}
  end

  def render("topic.json", %{topic: topic}) do
    %{data: topic}
  end
end
