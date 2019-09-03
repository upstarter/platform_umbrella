use Mix.Config

# Configure your database
config :platform, Platform.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "platform_dev",
  hostname: "localhost",
  port: "5432",
  pool_size: 10
