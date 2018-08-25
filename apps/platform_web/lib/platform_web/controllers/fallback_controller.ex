defmodule PlatformWeb.FallbackController do
  use PlatformWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(PlatformWeb.ErrorView, "error.json", changeset: changeset)
  end

  def call(conn, {:error, :login_failed}), do: login_failed(conn)
  def call(conn, {:error, :login_not_found}), do: login_failed(conn)

  defp login_failed(conn) do
    conn
    |> put_status(:unauthorized)
    |> render(PlatformWeb.ErrorView, "error.json",
      status: :unauthorized,
      message: "Authentication failed!"
    )
  end
end
