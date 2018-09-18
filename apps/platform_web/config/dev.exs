use Mix.Config

config :platform_web, :env, :dev

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :platform_web, PlatformWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/.bin/webpack-dev-server",
      "--inline",
      "--hot",
      "--stdin",
      "--host",
      "localhost",
      "--port",
      "8080",
      "--public",
      "localhost:8080",
      "--config",
      "webpack.config.js",
      cd: Path.expand("../assets", __DIR__)
    ]
  ],
  pubsub: [adapter: Phoenix.PubSub.PG2, name: PlatformWeb.PubSub]

# It also supports custom adapter configuration:
#
# [name: :my_pubsub, adapter: Phoenix.PubSub.Redis,
#  host: "192.168.100.1"]

# ## SSL Support
#
# In order to use HTTPS in development, a self-signed
# certificate can be generated by running the following
# command from your terminal:
#
#     openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" -keyout priv/server.key -out priv/server.pem
#
# The `http:` config above can be replaced with:
#
#     https: [port: 4000, keyfile: "priv/server.key", certfile: "priv/server.pem"],
#
# If desired, both `http:` and `https:` keys can be
# configured to run both http and https servers on
# different ports.

# Watch static and templates for browser reloading.
config :platform_web, PlatformWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|scss|sass|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{lib/platform_web/views/.*(ex)$},
      ~r{lib/platform_web/templates/.*(eex|haml)$}
    ]
  ]
