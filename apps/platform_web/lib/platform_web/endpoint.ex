defmodule PlatformWeb.Endpoint do
  @moduledoc false
  use Phoenix.Endpoint, otp_app: :platform_web

  socket("/socket", PlatformWeb.UserSocket)

  plug(Corsica,
    origins: "https://www.cryptowise.ai",
    allow_credentials: true,
    log: [rejected: :error, invalid: :warn, accepted: :debug]
  )

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  plug(Plug.Static,
    at: "/",
    from: :platform_web,
    gzip: true,
    only:
      ~w(css fonts images js favicon.ico robots.txt offline.html sw.js cache_manifest.json manifest.json)
  )

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket("/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket)
    plug(Phoenix.CodeReloader)
    plug(Phoenix.LiveReloader)
  end

  plug(Plug.Logger)

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Jason
  )

  plug(Plug.MethodOverride)
  plug(Plug.Head)

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug(Plug.Session,
    store: :cookie,
    key: "_cw_skey",
    http_only: true,
    # keep false in dev mode since no https in dev mode
    secure: true,
    signing_salt: "0QCm9hTQ",
    # number of seconds in 4 weeks
    # 4 * 7 * 24 * 60 * 60
    max_age: 60 * 60
  )

  plug(PlatformWeb.Router)

  @doc """
  Callback invoked for dynamically configuring the endpoint.

  It receives the endpoint configuration and checks if
  configuration should be loaded from the system environment.
  """
  def init(_key, config) do
    if config[:load_from_system_env] do
      port = System.get_env("PORT") || raise "expected the PORT environment variable to be set"

      # OPTIONAL Key for intermediate certificates
      # ca_file = System.get_env("INTERMEDIATE_CERTFILE")
      # cacertfile: Path.join(cert_dir, "ca.pem"),
      cert_dir = Application.app_dir(:platform_web, "priv/cert")

      opts = [
        http: [
          port: 8080
        ]
      ]

      #   https: [
      #     port: 443,
      #     certfile: Path.join(cert_dir, System.get_env("CW_CERTFILE")),
      #     keyfile: Path.join(cert_dir, System.get_env("CW_KEYFILE"))
      #   ]
      # ]

      {:ok, Mix.Config.merge(config, opts)}
    else
      {:ok, config}
    end
  end
end
