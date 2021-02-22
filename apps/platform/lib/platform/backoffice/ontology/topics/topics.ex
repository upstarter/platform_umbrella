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

  def arrange_topic(parent) do
    children = parent |> Topic.children() |> Repo.all()
    [parent, Enum.map(children, &arrange_topic/1)]
  end

  def taxonomy do
    root = Repo.get!(Topic, 20)
    topics = arrange_topic(root)
    JSONBuilder.to_map(topics)
  end

  def economics do
    root = Repo.get!(Topic, 1)
    nlist = arrange_topic(root)
    JSONBuilder.to_list(nlist)
  end

  def valuation do
    root = Repo.get!(Topic, 21)
    nlist = arrange_topic(root)
    JSONBuilder.to_list(nlist)
  end

  def strategy do
    root = Repo.get!(Topic, 2)
    nlist = arrange_topic(root)
    JSONBuilder.to_list(nlist)
  end

  def assets do
    root = Repo.get!(Topic, 193)
    nlist = arrange_topic(root)
    JSONBuilder.to_list(nlist)
  end

  def analysis do
    root = Repo.get!(Topic, 2)
    IO.inspect(['AAASnal', root])
    nlist = arrange_topic(root)
    JSONBuilder.to_list(nlist)
  end

  def research do
    root = Repo.get!(Topic, 14)
    nlist = arrange_topic(root)
    JSONBuilder.to_list(nlist)
  end

  def research_tree do
    root = Repo.get!(Topic, 123)
    nlist = arrange_topic(root)
    JSONBuilder.to_list(nlist)
  end

  # def gchart_arrange_topics(root_topic) do
  #   header = [
  #     "Sector",
  #     "Parent",
  #     "Market Cap",
  #     "Monthly Performance"
  #   ]
  #
  #   millitopics = root_topic |> Topic.children() |> Repo.all()
  #
  #   microtopics =
  #     for millitopic <- List.flatten(millitopics) do
  #       millitopic |> Topic.children() |> Repo.all()
  #     end
  #
  #   nanotopics =
  #     for microtopic <- List.flatten(microtopics) do
  #       microtopic |> Topic.children() |> Repo.all()
  #     end
  #
  #   picotopics =
  #     for nanotopic <- List.flatten(nanotopics) do
  #       nanotopic |> Topic.children() |> Repo.all()
  #     end
  #
  #   femtotopics =
  #     for picotopic <- List.flatten(picotopics) do
  #       picotopic |> Topic.children() |> Repo.all()
  #     end
  #
  #   root = arrange_root(root_topic)
  #   millitopics = Enum.map(List.flatten(millitopics), &arrange_topic/1)
  #   microtopics = Enum.map(List.flatten(microtopics), &arrange_topic/1)
  #   nanotopics = Enum.map(List.flatten(nanotopics), &arrange_topic/1)
  #   picotopics = Enum.map(List.flatten(picotopics), &arrange_topic/1)
  #   femtotopics = Enum.map(List.flatten(femtotopics), &arrange_topic/1)
  #
  #   nlist =
  #     [header, root] ++ millitopics ++ microtopics ++ nanotopics ++ picotopics ++ femtotopics
  #
  #   Enum.take(nlist, -100) |> IO.inspect()
  #   nlist
  # end
  #
  # def arrange_topic(topic) do
  # end

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
