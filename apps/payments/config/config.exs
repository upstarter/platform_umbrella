use Mix.Config

config :payments, ecto_repos: [Payments.Repo]

import_config "#{Mix.env}.exs"
