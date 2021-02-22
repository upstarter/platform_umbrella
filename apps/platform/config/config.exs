use Mix.Config

# General application configuration
config :platform,
  ecto_repos: [Platform.Repo],
  migration_timestamps: [type: :utc_datetime_usec]

config :platform, Platform.Integrations.EctoLogger, query_time_ms_threshold: 2_000
config :platform, Platform.ExchangeRates, enabled: false

config :platform, Platform.Market.History.Cataloger,
  enabled: false,
  # fetch interval in milliseconds
  history_fetch_interval: :timer.minutes(1),
  # Base backoff in milliseconds for failed requests to history API
  base_backoff: 100

# config :votex, Votex.DB, repo: Platform.Repo

import_config "#{Mix.env()}.exs"
