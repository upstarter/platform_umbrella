use Mix.Config

# General application configuration
config :platform,
  ecto_repos: [Platform.Repo],
  anything: 'anything here for config'

config :platform, Platform.Integrations.EctoLogger, query_time_ms_threshold: 2_000
config :platform, Platform.ExchangeRates, enabled: false
config :platform, Platform.Market.History.Cataloger, enabled: true

# config :votex, Votex.DB, repo: Platform.Repo

import_config "#{Mix.env()}.exs"
