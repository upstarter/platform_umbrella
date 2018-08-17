defmodule PlatformWeb.Application do
  @moduledoc """
  platform application
  """

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the endpoint when the application starts
      supervisor(PlatformWeb.Endpoint, []),
      # Start your own worker by calling: PlatformWeb.Worker.start_link(arg1, arg2, arg3)
      # worker(PlatformWeb.Worker, [arg1, arg2, arg3]),

      # TODO: REMOVE expire cache globally after 1 week
      worker(ConCache, [
        [
          name: :wise_cache,
          ttl_check_interval: :timer.seconds(1),
          global_ttl: :timer.seconds(604_800)
        ]
      ])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PlatformWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PlatformWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
