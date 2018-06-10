use Mix.Config

# Print only warnings and errors during test
config :logger,
  level: :warn,
  backends: [:console],
  compile_time_purge_level: :debug
