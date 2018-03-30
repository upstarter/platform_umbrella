use Mix.Config

config :users, ecto_repos: [Users.Repo]

import_config "#{Mix.env}.exs"
