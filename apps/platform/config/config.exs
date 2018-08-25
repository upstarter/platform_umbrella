use Mix.Config

config :platform, ecto_repos: [Platform.Repo]

config :platform, Platform.Auth.Guardian,
  issuer: "platform",
  secret_key: "2PZfkaxwq15SG4e5pz0/WughiYAp3h7wfytJyW4eK6//xx0Z5iPKJVfglr9Es0Y3"

import_config "#{Mix.env()}.exs"
