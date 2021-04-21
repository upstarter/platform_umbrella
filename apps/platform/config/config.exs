use Mix.Config

# General application configuration
config :platform,
  ecto_repos: [Platform.Repo],
  migration_timestamps: [type: :utc_datetime_usec]

config :platform, Platform.Integrations.EctoLogger, query_time_ms_threshold: 2_000

config :platform, Platform.Market.TokenCache,
  enabled: true,
  api_key: System.get_env("CMC_PRO_API_KEY")

config :platform, Platform.Market.History.Cataloger,
  enabled: true,
  # fetch interval in milliseconds
  history_fetch_interval: :timer.minutes(60),
  # Base backoff in milliseconds for failed requests to history API
  base_backoff: 100

# config :votex, Votex.DB, repo: Platform.Repo

import_config "#{Mix.env()}.exs"
