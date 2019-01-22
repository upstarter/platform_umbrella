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
    # let groups = data.map( (t) => {
    #   return { id: t.id, label: t.name, groups: [{}, {}] };
    # });
    # groups = %{}
    #
    # topics =
    #   from(p in Topic, where: p.id in ^roots)
    #   |> Repo.all()
    # exclusions

    econ_list = econ_tree()
    nlist = Topic.arrange(econ_list)
    JSONMapBuilder.to_map(nlist)
  end

  def econ_tree do
    # macroecon
    t2 = %Topic{id: 5, path: [1]}

    # microecon
    t3 = %Topic{id: 7, path: [1]}
    t5 = %Topic{id: 9, path: [1, 7]}
    t6 = %Topic{id: 10, path: [1, 7]}
    t7 = %Topic{id: 11, path: [1, 7]}
    t8 = %Topic{id: 12, path: [1, 7]}
    t9 = %Topic{id: 13, path: [1, 7]}
    t10 = %Topic{id: 14, path: [1, 7]}
    t11 = %Topic{id: 112, path: [1, 7]}
    # macroecon sectors
    t12 = %Topic{id: 6, path: [1, 5]}
    t13 = %Topic{id: 22, path: [1, 5, 6]}
    t14 = %Topic{id: 23, path: [1, 5, 6]}
    t15 = %Topic{id: 24, path: [1, 5, 6]}
    t16 = %Topic{id: 25, path: [1, 5, 6]}
    t17 = %Topic{id: 26, path: [1, 5, 6]}
    t18 = %Topic{id: 27, path: [1, 5, 6]}
    t19 = %Topic{id: 28, path: [1, 5, 6]}
    t20 = %Topic{id: 29, path: [1, 5, 6]}
    t21 = %Topic{id: 30, path: [1, 5, 6]}
    t22 = %Topic{id: 31, path: [1, 5, 6]}
    t23 = %Topic{id: 32, path: [1, 5, 6]}
    t24 = %Topic{id: 33, path: [1, 5, 6]}
    t25 = %Topic{id: 34, path: [1, 5, 6]}
    t26 = %Topic{id: 35, path: [1, 5, 6]}
    t27 = %Topic{id: 36, path: [1, 5, 6]}
    t28 = %Topic{id: 37, path: [1, 5, 6]}
    t29 = %Topic{id: 38, path: [1, 5, 6]}
    t30 = %Topic{id: 39, path: [1, 5, 6]}
    t31 = %Topic{id: 40, path: [1, 5, 6]}
    t32 = %Topic{id: 41, path: [1, 5, 6]}
    t33 = %Topic{id: 42, path: [1, 5, 6]}
    t34 = %Topic{id: 43, path: [1, 5, 6]}
    t35 = %Topic{id: 44, path: [1, 5, 6]}
    t36 = %Topic{id: 45, path: [1, 5, 6]}
    t37 = %Topic{id: 46, path: [1, 5, 6]}
    t38 = %Topic{id: 47, path: [1, 5, 6]}
    t39 = %Topic{id: 48, path: [1, 5, 6]}
    t40 = %Topic{id: 49, path: [1, 5, 6]}
    t41 = %Topic{id: 50, path: [1, 5, 6]}
    t42 = %Topic{id: 51, path: [1, 5, 6]}
    t43 = %Topic{id: 52, path: [1, 5, 6]}
    t44 = %Topic{id: 53, path: [1, 5, 6]}
    t45 = %Topic{id: 54, path: [1, 5, 6]}
    t46 = %Topic{id: 55, path: [1, 5, 6]}
    t47 = %Topic{id: 56, path: [1, 5, 6]}
    t48 = %Topic{id: 57, path: [1, 5, 6]}

    list = [
      t2,
      t3,
      t5,
      t6,
      t7,
      t8,
      t9,
      t10,
      t11,
      t12,
      t13,
      t14,
      t15,
      t16,
      t17,
      t18,
      t19,
      t20,
      t21,
      t22,
      t23,
      t24,
      t25,
      t26,
      t27,
      t28,
      t29,
      t30,
      t31,
      t32,
      t33,
      t34,
      t35,
      t36,
      t37,
      t38,
      t39,
      t40,
      t41,
      t42,
      t43,
      t44,
      t45,
      t46,
      t47,
      t48
    ]
  end

  def fundamental_tree do
    t1 = %Topic{id: 1}
    # macroecon
    t2 = %Topic{id: 5, path: [1]}

    # microecon
    t3 = %Topic{id: 7, path: [1]}
    t5 = %Topic{id: 9, path: [1, 7]}
    t6 = %Topic{id: 10, path: [1, 7]}
    t7 = %Topic{id: 11, path: [1, 7]}
    t8 = %Topic{id: 12, path: [1, 7]}
    t9 = %Topic{id: 13, path: [1, 7]}
    t10 = %Topic{id: 14, path: [1, 7]}
    t11 = %Topic{id: 112, path: [1, 7]}
    # macroecon sectors
    t12 = %Topic{id: 6, path: [1, 5]}
    t13 = %Topic{id: 22, path: [1, 5, 6]}
    t14 = %Topic{id: 23, path: [1, 5, 6]}
    t15 = %Topic{id: 24, path: [1, 5, 6]}
    t16 = %Topic{id: 25, path: [1, 5, 6]}
    t17 = %Topic{id: 26, path: [1, 5, 6]}
    t18 = %Topic{id: 27, path: [1, 5, 6]}
    t19 = %Topic{id: 28, path: [1, 5, 6]}
    t20 = %Topic{id: 29, path: [1, 5, 6]}
    t21 = %Topic{id: 30, path: [1, 5, 6]}
    t22 = %Topic{id: 31, path: [1, 5, 6]}
    t23 = %Topic{id: 32, path: [1, 5, 6]}
    t24 = %Topic{id: 33, path: [1, 5, 6]}
    t25 = %Topic{id: 34, path: [1, 5, 6]}
    t26 = %Topic{id: 35, path: [1, 5, 6]}
    t27 = %Topic{id: 36, path: [1, 5, 6]}
    t28 = %Topic{id: 37, path: [1, 5, 6]}
    t29 = %Topic{id: 38, path: [1, 5, 6]}
    t30 = %Topic{id: 39, path: [1, 5, 6]}
    t31 = %Topic{id: 40, path: [1, 5, 6]}
    t32 = %Topic{id: 41, path: [1, 5, 6]}
    t33 = %Topic{id: 42, path: [1, 5, 6]}
    t34 = %Topic{id: 43, path: [1, 5, 6]}
    t35 = %Topic{id: 44, path: [1, 5, 6]}
    t36 = %Topic{id: 45, path: [1, 5, 6]}
    t37 = %Topic{id: 46, path: [1, 5, 6]}
    t38 = %Topic{id: 47, path: [1, 5, 6]}
    t39 = %Topic{id: 48, path: [1, 5, 6]}
    t40 = %Topic{id: 49, path: [1, 5, 6]}
    t41 = %Topic{id: 50, path: [1, 5, 6]}
    t42 = %Topic{id: 51, path: [1, 5, 6]}
    t43 = %Topic{id: 52, path: [1, 5, 6]}
    t44 = %Topic{id: 53, path: [1, 5, 6]}
    t45 = %Topic{id: 54, path: [1, 5, 6]}
    t46 = %Topic{id: 55, path: [1, 5, 6]}
    t47 = %Topic{id: 56, path: [1, 5, 6]}
    t48 = %Topic{id: 57, path: [1, 5, 6]}

    list = [
      t1,
      t2,
      t3,
      t5,
      t6,
      t7,
      t8,
      t9,
      t10,
      t11,
      t12,
      t13,
      t14,
      t15,
      t16,
      t17,
      t18,
      t19,
      t20,
      t21,
      t22,
      t23,
      t24,
      t25,
      t26,
      t27,
      t28,
      t29,
      t30,
      t31,
      t32,
      t33,
      t34,
      t35,
      t36,
      t37,
      t38,
      t39,
      t40,
      t41,
      t42,
      t43,
      t44,
      t45,
      t46,
      t47,
      t48
    ]
  end

  def tech_tree do
    t1 = %Topic{id: 1}
    # macroecon
    t2 = %Topic{id: 5, path: [1]}

    # microecon
    t3 = %Topic{id: 7, path: [1]}
    t5 = %Topic{id: 9, path: [1, 7]}
    t6 = %Topic{id: 10, path: [1, 7]}
    t7 = %Topic{id: 11, path: [1, 7]}
    t8 = %Topic{id: 12, path: [1, 7]}
    t9 = %Topic{id: 13, path: [1, 7]}
    t10 = %Topic{id: 14, path: [1, 7]}
    t11 = %Topic{id: 112, path: [1, 7]}
    # macroecon sectors
    t12 = %Topic{id: 6, path: [1, 5]}
    t13 = %Topic{id: 22, path: [1, 5, 6]}
    t14 = %Topic{id: 23, path: [1, 5, 6]}
    t15 = %Topic{id: 24, path: [1, 5, 6]}
    t16 = %Topic{id: 25, path: [1, 5, 6]}
    t17 = %Topic{id: 26, path: [1, 5, 6]}
    t18 = %Topic{id: 27, path: [1, 5, 6]}
    t19 = %Topic{id: 28, path: [1, 5, 6]}
    t20 = %Topic{id: 29, path: [1, 5, 6]}
    t21 = %Topic{id: 30, path: [1, 5, 6]}
    t22 = %Topic{id: 31, path: [1, 5, 6]}
    t23 = %Topic{id: 32, path: [1, 5, 6]}
    t24 = %Topic{id: 33, path: [1, 5, 6]}
    t25 = %Topic{id: 34, path: [1, 5, 6]}
    t26 = %Topic{id: 35, path: [1, 5, 6]}
    t27 = %Topic{id: 36, path: [1, 5, 6]}
    t28 = %Topic{id: 37, path: [1, 5, 6]}
    t29 = %Topic{id: 38, path: [1, 5, 6]}
    t30 = %Topic{id: 39, path: [1, 5, 6]}
    t31 = %Topic{id: 40, path: [1, 5, 6]}
    t32 = %Topic{id: 41, path: [1, 5, 6]}
    t33 = %Topic{id: 42, path: [1, 5, 6]}
    t34 = %Topic{id: 43, path: [1, 5, 6]}
    t35 = %Topic{id: 44, path: [1, 5, 6]}
    t36 = %Topic{id: 45, path: [1, 5, 6]}
    t37 = %Topic{id: 46, path: [1, 5, 6]}
    t38 = %Topic{id: 47, path: [1, 5, 6]}
    t39 = %Topic{id: 48, path: [1, 5, 6]}
    t40 = %Topic{id: 49, path: [1, 5, 6]}
    t41 = %Topic{id: 50, path: [1, 5, 6]}
    t42 = %Topic{id: 51, path: [1, 5, 6]}
    t43 = %Topic{id: 52, path: [1, 5, 6]}
    t44 = %Topic{id: 53, path: [1, 5, 6]}
    t45 = %Topic{id: 54, path: [1, 5, 6]}
    t46 = %Topic{id: 55, path: [1, 5, 6]}
    t47 = %Topic{id: 56, path: [1, 5, 6]}
    t48 = %Topic{id: 57, path: [1, 5, 6]}

    list = [
      t1,
      t2,
      t3,
      t5,
      t6,
      t7,
      t8,
      t9,
      t10,
      t11,
      t12,
      t13,
      t14,
      t15,
      t16,
      t17,
      t18,
      t19,
      t20,
      t21,
      t22,
      t23,
      t24,
      t25,
      t26,
      t27,
      t28,
      t29,
      t30,
      t31,
      t32,
      t33,
      t34,
      t35,
      t36,
      t37,
      t38,
      t39,
      t40,
      t41,
      t42,
      t43,
      t44,
      t45,
      t46,
      t47,
      t48
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
