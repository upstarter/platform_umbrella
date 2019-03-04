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
    Topic
    |> Repo.all()
  end

  def list_topics_tree do
    t = Repo.get!(Platform.Topics.Topic, 1)
    tree = Repo.all(Topic.descendants(t))
    require IEx
    IEx.pry()
    nlist = Topic.arrange(tree)
    JSONMapBuilder.to_map(nlist)
  end

  def analysis do
    t = Repo.get!(Platform.Topics.Topic, 2)
    tree = Repo.all(Topic.descendants(t))
    nlist = Topic.arrange(tree)
    JSONMapBuilder.to_map(nlist)
  end

  def valuation do
    t = Repo.get!(Platform.Topics.Topic, 21)
    tree = Repo.all(Topic.descendants(t))
    nlist = Topic.arrange(tree)
    JSONMapBuilder.to_map(nlist)
  end

  def taxonomy do
    t = Repo.get!(Platform.Topics.Topic, 20)
    tree = Repo.all(Topic.descendants(t))
    nlist = Topic.arrange(tree)
    JSONMapBuilder.to_map(nlist)
  end

  def research do
    research_list = research_tree()
    nlist = Topic.arrange(research_list)
    JSONMapBuilder.to_map(nlist)
  end

  def research_tree do
    t1 = %Topic{id: 14, path: [2]}

    t2 = %Topic{id: 60, path: [2]}
    t3 = %Topic{id: 61, path: [2]}
    t4 = %Topic{id: 62, path: [2]}
    t5 = %Topic{id: 63, path: [2]}
    t6 = %Topic{id: 64, path: [2]}
    t7 = %Topic{id: 65, path: [2]}
    t8 = %Topic{id: 66, path: [2]}
    t9 = %Topic{id: 67, path: [2]}
    t10 = %Topic{id: 68, path: [2]}
    t11 = %Topic{id: 69, path: [2]}
    t12 = %Topic{id: 70, path: [2]}
    t13 = %Topic{id: 71, path: [2]}

    list = [
      t1,
      t2,
      t3,
      t4,
      t5,
      t6,
      t7,
      t8,
      t9,
      t10,
      t11,
      t12,
      t13
    ]
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
