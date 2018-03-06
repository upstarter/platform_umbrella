use Mix.Config

config :platform, ecto_repos: [Platform.Repo]

import_config "#{Mix.env}.exs"
