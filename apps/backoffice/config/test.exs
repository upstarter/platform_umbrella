use Mix.Config

# Configure your database
config :backoffice, Backoffice.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "backoffice_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
