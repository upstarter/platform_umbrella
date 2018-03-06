use Mix.Config

config :auth, ecto_repos: [Auth.Repo]

import_config "#{Mix.env}.exs"
