use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).

# Configure your database
config :platform, Platform.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "platform_prod",
  username: System.get_env("POSTGRES_USER"),
  password: System.get_env("PGPASSWORD"),
  # ssl: true,
  hostname: System.get_env("DATABASE_URL"),
  socket_dir: "/var/run/postgresql",
  port: "5432",
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "30")
