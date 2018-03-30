use Mix.Config

# Configure your database
config :users, Users.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "users_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
