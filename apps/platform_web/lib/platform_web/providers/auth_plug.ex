defmodule PlatformWeb.Providers.AuthPlug do
  # ... other code ommitted for brevity

  defp get_user(%Plug.Conn{} = conn) do
    conn
    |> Plug.Conn.get_session(:user_id)
    |> Platform.Providers.get_provider()
  end
end
