defmodule Auth.Application do
  @moduledoc """
  The Auth Application Service.

  The auth system business domain lives in this application.

  Exposes API to clients such as the `AuthWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(Auth.Repo, []),
    ], strategy: :one_for_one, name: Auth.Supervisor)
  end
end
