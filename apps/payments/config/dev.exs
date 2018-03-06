use Mix.Config

# Configure your database
config :payments, Payments.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "payments_dev",
  hostname: "localhost",
  pool_size: 10
