use Mix.Config

config :platform, ecto_repos: [Platform.Repo]

config :platform, Platform.Auth.TokenSerializer,
  issuer: "platform",
  secret_key: "g9JWqDeeXmQxrqqgxsjzW6Ekn7lba0ALVKJVirzk2alB1NhPhvBWOLNA7NCDUqk6",
  ttl: {1, :days},
  token_ttl: %{
    "refresh" => {30, :days},
    "access" => {1, :days}
  }

import_config "#{Mix.env()}.exs"
