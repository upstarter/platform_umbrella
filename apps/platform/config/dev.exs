use Mix.Config

# Configure your database
config :platform, Platform.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "platform_dev",
  hostname: "localhost",
  code_reloader: true,
  port: "5432",
  pool_size: 10
