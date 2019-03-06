alias Platform.Repo
alias Platform.Topics.Topic

defmodule JSONMapBuilder do
  def to_map(list) when is_list(list) and length(list) > 0 do
    require IEx
    IEx.pry()

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
      id: key.id,
      slug: topic.slug,
      name: topic.name,
      description: topic.description,
      groups: to_map(value)
    }

    require IEx
    IEx.pry()
    map
  end

  def to_map(tuple) when is_tuple(tuple) do
    {key, value} = tuple
    it = Enum.into([{key, to_map(value)}], %{})
    require IEx
    IEx.pry()
    it
  end

  def to_map(value), do: value
end
