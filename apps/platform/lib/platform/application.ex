defmodule Platform.Application do
  @moduledoc """
  The Platform Application Service.

  The platform system business domain lives in this application.

  Exposes API to clients such as the `PlatformWeb` application
  for use in channels, controllers, and elsewhere.
  """

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    base_children = [
      Platform.Repo,
      Supervisor.child_spec({Task.Supervisor, name: Platform.MarketTaskSupervisor},
        id: Platform.MarketTaskSupervisor
      ),
      Supervisor.child_spec({Task.Supervisor, name: Platform.TaskSupervisor},
        id: Platform.TaskSupervisor
      ),
      {Registry, keys: :duplicate, name: Registry.MarketEvents, id: Registry.MarketEvents},
      {Platform.Repo, [show_sensitive_data_on_connection_error: true]}
    ]

    children = base_children ++ configurable_children()

    opts = [strategy: :one_for_one, name: Platform.Supervisor]

    Supervisor.start_link(children, opts)
  end

  defp configurable_children do
    [
      configure(Platform.Market.TokenCache),
      configure(Platform.Market.History.Cataloger)
    ]
    |> List.flatten()
  end

  defp should_start?(process) do
    :platform
    |> Application.fetch_env!(process)
    |> Keyword.fetch!(:enabled)
  end

  defp configure(process) do
    if should_start?(process) do
      process
    else
      []
    end
  end
end
