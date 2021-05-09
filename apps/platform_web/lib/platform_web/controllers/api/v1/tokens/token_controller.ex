defmodule PlatformWeb.V1.Tokens.TokenController do
  use PlatformWeb, :controller

  alias Platform.Tokens
  alias Platform.Tokens.Token

  def search(conn, %{"q" => q}) do
    tokens = Tokens.search_tokens(q)
    render(conn, "index.json", tokens: tokens)
  end

  def index(conn, params) do
    tokens = Tokens.list_tokens(params)

    render(conn, "index.json", tokens: tokens)
  end

  def create(conn, %{"token" => token_params}) do
    with {:ok, Token = token} <- Tokens.create_token(token_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.token_path(conn, :show, token))
      |> render("show.json", token: token)
    end
  end

  def show(conn, %{"id" => id}) do
    token = Tokens.get_token!(id)
    render(conn, "show.json", token: token)
  end

  def update(conn, %{"id" => id, "token" => token_params}) do
    token = Tokens.get_token!(id)

    with {:ok, Token = token} <- Tokens.update_token(token, token_params) do
      render(conn, "show.json", token: token)
    end
  end

  def delete(conn, %{"id" => id}) do
    token = Tokens.get_token!(id)

    with {:ok, Token} <- Tokens.delete_token(token) do
      send_resp(conn, :no_content, "")
    end
  end
end
