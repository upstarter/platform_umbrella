use Mix.Config

# Configure your database
config :platform, Platform.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "platform_dev",
  hostname: "localhost",
  code_reloader: true,
  port: "5432",
  pool_size: 20
  # pool_timeout: 60_000,
  # timeout: 80_000,
  # queue_target: 200,
  # queue_interval: 2000
