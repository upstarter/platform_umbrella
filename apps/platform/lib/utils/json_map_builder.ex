alias Platform.Repo
alias Platform.Topics.Topic

defmodule JSONMapBuilder do
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
    %{id: key.id, name: topic.name, description: topic.description, groups: to_map(value)}
  end

  def to_map(tuple) when is_tuple(tuple) do
    {key, value} = tuple
    Enum.into([{key, to_map(value)}], %{})
  end

  def to_map(value), do: value
end
