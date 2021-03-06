defmodule Platform.Tokens.Token do
  @moduledoc """

    tokens on the platform

  """

  use Ecto.Schema
  import Ecto.Changeset

  alias Platform.Users.User
  alias Platform.Topics.Topic
  alias Platform.Market.DailyMarketHistory

  @derive {Jason.Encoder,
           only: [
             :id,
             :name,
             :description,
             :symbol,
             :market_cap_usd,
             :percent_change_1h,
             :percent_change_24h,
             :percent_change_7d,
             :percent_change_30d
           ]}

  schema "tokens" do
    field(:name, :string)
    field(:symbol, :string)
    field(:img_url, :string)
    field(:description, :string)
    field(:site, :string)
    field(:last_updated, :utc_datetime)
    field(:btc_price, :decimal)
    field(:usd_price, :decimal)
    field(:cmc_id, :integer)
    field(:market_cap_usd, :decimal)
    field(:market_cap_btc, :decimal)
    field(:circulating_supply, :decimal)
    field(:total_supply, :decimal)
    field(:max_supply, :decimal)
    field(:platform_id, :integer)
    field(:platform_name, :string)
    field(:percent_change_1h, :decimal)
    field(:percent_change_24h, :decimal)
    field(:percent_change_7d, :decimal)
    field(:percent_change_30d, :decimal)
    field(:volume_1h, :decimal)
    field(:volume_24h, :decimal)
    field(:volume_7d, :decimal)
    field(:volume_30d, :decimal)

    many_to_many(:users_tokens, User, join_through: "users_tokens")
    many_to_many(:topics, Topic, join_through: "topics_tokens")
    has_many(:daily_market_history, DailyMarketHistory)
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
      :market_cap_usd,
      :percent_change_1h,
      :percent_change_24h,
      :percent_change_7d,
      :percent_change_30d
    ])
    |> validate_required([
      :id,
      :name,
      :description,
      :symbol,
      :market_cap_usd,
      :percent_change_1h,
      :percent_change_24h,
      :percent_change_7d,
      :percent_change_30d
    ])
  end
end
