use Mix.Config

config :backoffice, ecto_repos: [Backoffice.Repo]

import_config "#{Mix.env}.exs"
