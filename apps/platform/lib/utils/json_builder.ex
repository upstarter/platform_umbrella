alias Platform.Repo
alias Platform.Topics.Topic

defmodule JSONBuilder do
  def to_map(list) when is_list(list) and length(list) > 0 do
    case list |> List.first() do
      {_, _} ->
        Enum.map(list, fn tuple ->
          {key, value} = tuple
          do_to_map(key, value)
        end)

      _ ->
        list
    end
  end

  def do_to_map(key, value) do
    topic = Repo.get(Topic, key.id)

    map = %{
      name: topic.name,
      value: topic.description,
      children: to_map(value)
    }

    map
  end

  def to_map(tuple) when is_tuple(tuple) do
    {key, value} = tuple
    Enum.into([{key, to_map(value)}], %{})
  end

  def to_map(value), do: value

  def to_list(list) when is_list(list) and length(list) > 0 do
    case list |> List.first() do
      {_, _} ->
        Enum.flat_map(list, fn tuple ->
          {key, value} = tuple
          do_to_list(key, value)
        end)

      _ ->
        list
    end
  end

  def do_to_list(topic, value) do
    list = [
      "#{topic.name} #{topic.description}",
      "Taxonomy",
      0,
      0
    ]

    children = to_list(value)
    list.prepend(children)
  end

  def to_list(tuple) when is_tuple(tuple) do
    {key, value} = tuple
    Enum.into([key, to_list(value)], [])
  end
end
