use Mix.Config

# Configure your database
config :platform, Platform.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "platform_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :bcrypt_elixir, :log_rounds, 4
