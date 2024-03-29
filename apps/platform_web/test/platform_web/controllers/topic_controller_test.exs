defmodule PlatformWeb.TopicControllerTest do
  use PlatformWeb.ConnCase

  alias Platform.Topics
  alias Platform.Topics.Topic

  @create_attrs %{long_desc: "some long_desc", name: "some name", short_desc: "some short_desc"}
  @update_attrs %{long_desc: "some updated long_desc", name: "some updated name", short_desc: "some updated short_desc"}
  @invalid_attrs %{long_desc: nil, name: nil, short_desc: nil}

  def fixture(:topic) do
    {:ok, topic} = Topics.create_topic(@create_attrs)
    topic
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all topics", %{conn: conn} do
      conn = get conn, topic_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create topic" do
    test "renders topic when data is valid", %{conn: conn} do
      conn = post conn, topic_path(conn, :create), topic: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, topic_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "long_desc" => "some long_desc",
        "name" => "some name",
        "short_desc" => "some short_desc"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, topic_path(conn, :create), topic: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update topic" do
    setup [:create_topic]

    test "renders topic when data is valid", %{conn: conn, topic: %Topic{id: id} = topic} do
      conn = put conn, topic_path(conn, :update, topic), topic: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, topic_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "long_desc" => "some updated long_desc",
        "name" => "some updated name",
        "short_desc" => "some updated short_desc"}
    end

    test "renders errors when data is invalid", %{conn: conn, topic: topic} do
      conn = put conn, topic_path(conn, :update, topic), topic: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete topic" do
    setup [:create_topic]

    test "deletes chosen topic", %{conn: conn, topic: topic} do
      conn = delete conn, topic_path(conn, :delete, topic)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, topic_path(conn, :show, topic)
      end
    end
  end

  defp create_topic(_) do
    topic = fixture(:topic)
    {:ok, topic: topic}
  end
end
