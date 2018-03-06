defmodule Backoffice.Application do
  @moduledoc """
  The Backoffice Application Service.

  The backoffice system business domain lives in this application.

  Exposes API to clients such as the `BackofficeWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(Backoffice.Repo, []),
    ], strategy: :one_for_one, name: Backoffice.Supervisor)
  end
end
