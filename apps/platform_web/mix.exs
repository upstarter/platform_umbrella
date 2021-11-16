defmodule PlatformWeb.Mixfile do
  use Mix.Project

  def project do
    [
      app: :platform_web,
      version: "0.0.1",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {PlatformWeb.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  defp deps do
    [
      {:httpoison, "~> 1.5.1", override: true},
      {:jason, "~> 1.0", override: true},
      {:phoenix, "~> 1.5.3"},
      {:platform, in_umbrella: true},
      {:plug_cowboy, "~> 2.5.2"},
      {:guardian, "~> 2.0"},
      # {:guardian_trackable, "~> 0.2.0"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_haml, "~> 0.2", override: true},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:gettext, "~> 0.17"},
      {:corsica, "~> 1.0"},
      {:cowboy, "~> 2.7"},
      {:bamboo, "~> 1.3.0"},
      # {:absinthe, "~> 1.4.0"},
      {:get_medium, "~> 0.3.0", override: true},
      # html parser
      {:floki, "~> 0.21.0"},
      {:con_cache, "~> 0.13.1"},
      {:ueberauth, "~> 0.6"},
      {:ueberauth_google, "~> 0.8"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, we extend the test task to create and migrate the database.
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [test: ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
