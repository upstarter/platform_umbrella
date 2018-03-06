defmodule Payments.Application do
  @moduledoc """
  The Payments Application Service.

  The payments system business domain lives in this application.

  Exposes API to clients such as the `PaymentsWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(Payments.Repo, []),
    ], strategy: :one_for_one, name: Payments.Supervisor)
  end
end
