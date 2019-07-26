defmodule MyApp.Plug.RememberMe do
  import Plug.Conn
  import Guardian.Plug

  def init(opts \\ %{}), do: Enum.into(opts, %{})

  def call(conn, _) do
    current_user = current_resource(conn)

    if current_user == nil do
      jwt = conn.req_cookies["remember_me"]

      case Guardian.decode_and_verify(jwt) do
        {:ok, claims} ->
          the_key = Map.get(claims, :key, :default)
          put_session(conn, Guardian.Keys.base_key(the_key), jwt)
      end
    end
  end
end
