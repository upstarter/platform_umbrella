use Mix.Config

config :platform_web, :env, :prod

# For production, we often load configuration from external
# sources, such as your system environment. For this reason,
# you won't find the :http configuration below, but set inside
# PlatformWeb.Endpoint.init/2 when load_from_system_env is
# true. Any dynamic configuration should be done there.
#
# Don't forget to configure the url host to something meaningful,
# Phoenix uses this information when generating URLs.
#
# Finally, we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the mix phx.digest task
# which you typically run after static files are built.
config :platform_web, PlatformWeb.Endpoint,
  env: :prod,
  load_from_system_env: true,
  http: [port: 8080],
  url: [scheme: "http", host: "cryptowise.ai", port: 8080],
  # https: [
  #   otp_app: :platform_web
  # ],
  # force_ssl: [
  #   host: nil,
  #   rewrite_on: [:x_forwarded_proto]
  # ],
  secret_key_base: "zSs42WIom2Vw/5MxHUfi+lqgOBFp0D1n4fJeHxaZ9yYAb9EzzoepurcxCXq3IBha",
  check_origin: ["https://www.cryptowise.ai"],
  # check_origin: false,
  server: true,
  root: ".",
  cache_static_manifest: "priv/static/cache_manifest.json",
  render_errors: [view: PlatformWeb.ErrorView, accepts: ~w(html haml json)],
  pubsub: [name: PlatformWeb.PubSub, adapter: Phoenix.PubSub.PG2]

config :cors_plug,
  origin: [
    "https://www.cryptowise.ai",
    "https://cryptowise.ai",
    "http://www.cryptowise.ai",
    "http://cryptowise.ai",
    "https://api.cryptowise.ai",
    "http://api.cryptowise.ai"
  ],
  credentials: true,
  headers: [
    "Accept",
    "Authorization",
    "Cache-Control",
    "Content-Type",
    "DNT",
    "If-Modified-Since",
    "Keep-Alive",
    "Origin",
    "User-Agent",
    "X-Requested-With",
    "X-CSRF-TOKEN"
  ]

# ## SSL Support
#
# To get SSL working, you will need to add the `https` key
# to the previous section and set your `:url` port to 443:
#
#     config :platform_web, PlatformWeb.Endpoint,
#       ...
#       url: [host: "example.com", port: 443],
#       https: [:inet6,
#               port: 443,
#               keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#               certfile: System.get_env("SOME_APP_SSL_CERT_PATH")]
#
# Where those two env variables return an absolute path to
# the key and cert in disk or a relative path inside priv,
# for example "priv/ssl/server.key".
#
# We also recommend setting `force_ssl`, ensuring no data is
# ever sent via http, always redirecting to https:
#
#     config :platform_web, PlatformWeb.Endpoint,
#       force_ssl: [hsts: true]
#
# Check `Plug.SSL` for all available options in `force_ssl`.

# ## Using releases
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start the server for all endpoints:
#
#     config :phoenix, :serve_endpoints, true
#
# Alternatively, you can configure exactly which server to
# start per endpoint:
#
#     config :platform_web, PlatformWeb.Endpoint, server: true
#

# Finally import the config/prod.secret.exs
# which should be versioned separately.
# import_config "prod.secret.exs"
