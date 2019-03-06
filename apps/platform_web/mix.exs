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
      extra_applications: [:logger, :runtime_tools, :ueberauth]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.3.1"},
      {:plug_cowboy, "~> 1.0"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_haml, "~> 0.2", override: true},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:cors_plug, "~> 1.5"},
      {:cowboy, "~> 1.0"},
      {:bamboo, "~> 0.8"},
      # {:absinthe, "~> 1.4.0"},
      {:platform, in_umbrella: true},
      {:get_medium, "~> 0.3.0"},
      # html parser
      {:floki, "~> 0.20.0"},
      {:con_cache, "~> 0.13.0"},
      {:ueberauth, "~> 0.5"}
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
