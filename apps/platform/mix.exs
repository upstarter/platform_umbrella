defmodule Platform.Mixfile do
  use Mix.Project

  def project do
    [
      app: :platform,
      version: "0.0.1",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env()),
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
      mod: {Platform.Application, []},
      extra_applications: [:logger, :runtime_tools]
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
      {:arbor, "~> 1.1.0"},
      {:argon2_elixir, "~> 2.0"},
      {:comeonin, "~> 5.1.1"},
      {:ecto_sql, "~> 3.5.0"},
      {:postgrex, ">= 0.0.0"},
      {:httpoison, "~> 1.5.1"},
      {:jason, "~> 1.0"},
      # {:ecto_autoslug_field, "~> 2.0"},
      # {:ex_machina, "~> 2.3", only: :test},
      {:timex, "~> 3.0"}
      # {:timex_ecto, "~> 3.0"}
      # {:votex, "~> 0.3.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
