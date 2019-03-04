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

config :ueberauth, Ueberauth,
  providers: [
    linkedin: {Ueberauth.Strategy.Linkedin, [opt1: "value", opts2: "value"]},
    github: {Ueberauth.Strategy.Github, [opt1: "value", opts2: "value"]}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :platform_web, :generators, context_app: :platform

config :phoenix, :template_engines, haml: PhoenixHaml.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
