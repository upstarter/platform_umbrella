defmodule Platform.Umbrella.Mixfile do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options.
  #
  # Dependencies listed here are available only for this project
  # and cannot be accessed from applications inside the apps folder
  defp deps do
    [
      {:phoenix_ecto, "~> 3.3", override: true},
      {:postgrex, "~> 0.13.5", override: true},
      {:poison, "~> 3.1", override: true},
      {:hackney, "~> 1.6", override: true},
      {:gettext, "~> 0.13.0", override: true},
      {:distillery, "~> 1.5", runtime: false},
      {:credo, "~> 0.9.0-rc1", only: [:dev, :test], runtime: false},
      {:elixir_make, "~> 0.4", runtime: false},


      # {:basic_auth, "~> 2.2"},
      # {:users, in_umbrella: true},
      # {:partners, in_umbrella: true},
      # {:payments, in_umbrella: true},
    ]
  end
end
