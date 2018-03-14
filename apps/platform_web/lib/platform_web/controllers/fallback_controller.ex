defmodule PlatformWeb.FallbackController do
  use PlatformWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(PlatformWeb.ErrorView, "error.json", changeset: changeset)
  end
end
