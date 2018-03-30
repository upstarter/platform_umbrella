defmodule Users.Application do
  @moduledoc """
  The Users Application Service.

  The users system business domain lives in this application.

  Exposes API to clients such as the `UsersWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(Users.Repo, []),
    ], strategy: :one_for_one, name: Users.Supervisor)
  end
end
