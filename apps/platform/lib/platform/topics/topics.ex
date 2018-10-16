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
    one = [0, 1, 2, 3, 4, 7, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 22]
    two = [25, 26, 27, 30, 31, 32, 33, 34, 35, 36, 37, 39, 40, 44, 46, 47]
    three = [54, 55, 59, 60, 63, 64, 65, 66, 67, 69, 70, 71]
    include = one ++ two ++ three

    Topic |> where([p], p.id in ^include) |> Repo.all()
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
