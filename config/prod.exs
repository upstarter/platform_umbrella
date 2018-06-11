use Mix.Config

config :platform_umbrella, Platform.Umbrella.Endpoint,
  load_from_system_env: true,
  http: [port: {:system, "PORT"}],
  url: [host: "cryptowise.ai", port: {:system, "PORT"}], # This is critical for ensuring web-sockets properly authorize.
  check_origin: false,
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true,
  root: "."
# Do not print debug messages in production
config :logger, level: :info
