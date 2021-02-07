defmodule PlatformWeb.V1.Topics.TopicController do
  use PlatformWeb, :controller

  alias Platform.Topics
  alias Platform.Topics.Topic

  def tree(conn, _params) do
    topics = Topics.list_topics()
    render(conn, "tree.json", topics: topics)
  end

  def signup_topics(conn, _params) do
    topics = Topics.list_topics()
    render(conn, "tree.json", topics: topics)
  end

  def economics(conn, _params) do
    topics = Topics.economics()
    render(conn, "economics.json", topics: topics)
  end

  def analysis(conn, _params) do
    topics = Topics.analysis()
    render(conn, "analysis.json", topics: topics)
  end

  def research(conn, _params) do
    topics = Topics.research()
    render(conn, "research.json", topics: topics)
  end

  def strategy(conn, _params) do
    topics = Topics.strategy()
    render(conn, "strategy.json", topics: topics)
  end

  def taxonomy(conn, params) do
    topics = Topics.taxonomy()
    render(conn, "taxonomy.json", topics: topics)
  end

  def valuation(conn, _params) do
    topics = Topics.valuation()
    render(conn, "valuation.json", topics: topics)
  end

  def index(conn, params) do
    topics = Topics.taxonomy()
    render(conn, "index.json", topics: topics)
  end

  def create(conn, %{"topic" => topic_params}) do
    with {:ok, Topic = topic} <- Topics.create_topic(topic_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.topic_path(conn, :show, topic))
      |> render("show.json", topic: topic)
    end
  end

  def show(conn, %{"id" => id}) do
    topics = Topics.get_topic!(id) |> Topics.arrange_topic()
    render(conn, "taxonomy.json", topics: topics)
  end

  def update(conn, %{"id" => id, "topic" => topic_params}) do
    topic = Topics.get_topic!(id)

    with {:ok, Topic = topic} <- Topics.update_topic(topic, topic_params) do
      render(conn, "show.json", topic: topic)
    end
  end

  def delete(conn, %{"id" => id}) do
    topic = Topics.get_topic!(id)

    with {:ok, Topic} <- Topics.delete_topic(topic) do
      send_resp(conn, :no_content, "")
    end
  end
end
