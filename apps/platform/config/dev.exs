use Mix.Config

# Configure your database
config :platform, Platform.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "platform_dev",
  hostname: "localhost",
  pool_size: 10
