# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :platform_web,
  namespace: PlatformWeb,
  ecto_repos: [Platform.Repo]

# Configures the endpoint
config :platform_web, PlatformWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zSs42WIom2Vw/5MxHUfi+lqgOBFp0D1n4fJeHxaZ9yYAb9EzzoepurcxCXq3IBha",
  render_errors: [view: PlatformWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PlatformWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :platform_web, :generators,
  context_app: :platform

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
