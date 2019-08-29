defmodule Platform.Topics do
  @moduledoc """

    The Topics context.

  """

  import Ecto.Query, warn: false
  alias Platform.Repo
  alias Platform.Topics.Topic

  @doc """

  Returns the list of topics.

  ## Examples

      iex> list_topics() [%Topic{}, ...]

  """

  def list_topics do
    roots = Topic.roots() |> Repo.all()
    topics = arrange_roots(roots)
    Enum.shuffle(topics)
  end

  def arrange_roots(roots) do
    subtopics =
      for root_topic <- roots do
        root_topic |> Topic.children() |> Repo.all()
      end

    subsubtopics =
      for subtopic <- List.flatten(subtopics) do
        subtopic |> Topic.children() |> Repo.all()
      end

    List.flatten(roots ++ subtopics ++ subsubtopics)
  end

  def arrange(topic) do
    children = topic |> Topic.children() |> Repo.all()
    {topic, Enum.map(children, &arrange/1)}
  end

  def list_topics_tree do
    root = Repo.get!(Platform.Topics.Topic, 1)
    nlist = [arrange(root)]
    JSONMapBuilder.to_map(nlist)
  end

  def taxonomy do
    root = Repo.get!(Platform.Topics.Topic, 20)
    nlist = [arrange(root)]
    JSONMapBuilder.to_map(nlist)
  end

  def valuation do
    root = Repo.get!(Platform.Topics.Topic, 21)
    nlist = [arrange(root)]
    JSONMapBuilder.to_map(nlist)
  end

  def strategy do
    root = Repo.get!(Platform.Topics.Topic, 17)
    nlist = [arrange(root)]
    JSONMapBuilder.to_map(nlist)
  end

  def analysis do
    root = Repo.get!(Platform.Topics.Topic, 2)
    nlist = [arrange(root)]
    JSONMapBuilder.to_map(nlist)
  end

  def research do
    root = Repo.get!(Platform.Topics.Topic, 14)
    nlist = [arrange(root)]
    JSONMapBuilder.to_map(nlist)
  end

  def research_tree do
    root = Repo.get!(Platform.Topics.Topic, 123)
    nlist = [arrange(root)]
    JSONMapBuilder.to_map(nlist)
  end

  @doc """

  Gets a single topic.

  Raises `Ecto.NoResultsError` if the Topic does not exist.

  ## Examples

      iex> get_topic!(123) %Topic{}

      iex> get_topic!(456) ** (Ecto.NoResultsError)

  """

  def get_topic!(id), do: Repo.get!(Topic, id)

  @doc """

  Creates a topic.

  ## Examples

      iex> create_topic(%{field: value}) {:ok, %Topic{}}

      iex> create_topic(%{field: bad_value}) {:error, %Ecto.Changeset{}}

  """

  def create_topic(attrs \\ %{}) do
    %Topic{}
    |> Topic.changeset(attrs)
    |> Repo.insert()
  end

  @doc """

  Updates a topic.

  ## Examples

      iex> update_topic(topic, %{field: new_value}) {:ok, %Topic{}}

      iex> update_topic(topic, %{field: bad_value}) {:error, %Ecto.Changeset{}}

  """

  def update_topic(%Topic{} = topic, attrs) do
    topic |> Topic.changeset(attrs) |> Repo.update()
  end

  @doc """

  Deletes a Topic.

  ## Examples

      iex> delete_topic(topic) {:ok, %Topic{}}

      iex> delete_topic(topic) {:error, %Ecto.Changeset{}}

  """

  def delete_topic(%Topic{} = topic) do
    Repo.delete(topic)
  end

  @doc """

  Returns an `%Ecto.Changeset{}` for tracking topic changes.

  ## Examples

      iex> change_topic(topic) %Ecto.Changeset{source: %Topic{}}

  """

  def change_topic(%Topic{} = topic) do
    Topic.changeset(topic, %{})
  end
end
