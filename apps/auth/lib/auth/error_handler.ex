defmodule Designers.Auth.ErrorHandler do
  import Plug.Conn
  use Phoenix.Controller, namespace: DesignersWeb

  def auth_error(conn, {type, _reason}, _opts) do
    # body = Poison.encode!(%{message: to_string(type)})
    # body = to_string(type) # do text for now
    # send_resp(conn, 401, body)
    conn
    |> put_flash(:info, "  Please Sign In.")
    |> redirect(to: "/users/new")
  end
end
