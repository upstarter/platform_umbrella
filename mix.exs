defmodule Platform.Umbrella.Mixfile do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      # Docs
      name: "CryptoWise Platform",
      source_url: "https://github.com/USER/PROJECT",
      homepage_url: "http://YOUR_PROJECT_HOMEPAGE",
      # The main page in the docs
      docs: [
        main: "Platform",
        logo: "apps/platform_web/assets/static/images/nav_logo.png",
        extras: ["README.md"],
        ignore_apps: [:platform_web]
      ],
      releases: [
        default: [
          version: "0.0.1",
          applications: [platform_web: :permanent, platform: :permanent]
        ]
      ]
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
      {:poison, "~> 3.1", override: true},
      {:httpoison, "~> 1.4"},
      {:hackney, "~> 1.6", override: true},
      {:gettext, "~> 0.13.0", override: true},
      {:distillery, "~> 2.1", runtime: false},
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},
      {:elixir_make, "~> 0.4", runtime: false},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:policy_wonk, "~> 1.0.0"},
      {:timex, "~> 3.0"}
    ]
  end
end
