defmodule Platform.Tokens.Token do
  @moduledoc """

    tokens on the platform

  """

  use Ecto.Schema

  import Ecto.Changeset

  alias Platform.Users.User
  alias Platform.Topics.Topic
  alias Platform.Market.TokenCache.CacheToken
  alias Platform.Market.DailyMarketHistory

  @derive {Jason.Encoder,
           only: [
             :id,
             :name,
             :description,
             :symbol,
             :platform_name,
             :tags
           ]}

  schema "tokens" do
    field(:name, :string)
    field(:symbol, :string)
    field(:img_url, :string)
    field(:description, :string)
    field(:site, :string)

    embeds_one(:token_info, CacheToken, on_replace: :delete)
    many_to_many(:users_tokens, User, join_through: "users_tokens")
    many_to_many(:topics, Topic, join_through: "topics_tokens")
    has_many(:daily_market_history, DailyMarketHistory)

    many_to_many(:tags, Platform.Tokens.Tags, join_through: "tokens_tags")
    timestamps()
  end

  @doc false
  def changeset(token, attrs) do
    token
    |> cast(attrs, [
      :id,
      :name,
      :description,
      :symbol,
      :tags
    ])
    |> cast_embed(:token_info)
    |> validate_required([
      :id,
      :name,
      :description,
      :symbol,
      :tags
    ])
  end
end
