defmodule Role do
  use Ecto.Schema

  embedded_schema do
    field(:title)
    field(:active)
  end
end
