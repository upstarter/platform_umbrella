use Mix.Config

# Configure your database
config :backoffice, Backoffice.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "backoffice_dev",
  hostname: "localhost",
  pool_size: 10
