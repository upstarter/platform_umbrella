use Mix.Config

# Configure your database
config :payments, Payments.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "payments_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
