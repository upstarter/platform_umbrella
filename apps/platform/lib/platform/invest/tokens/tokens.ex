defmodule Platform.Tokens do
  @moduledoc """

    The Tokens context.

  """

  import Ecto.Query, warn: false
  alias Platform.Repo

  alias Platform.Tokens.Token
  alias Platform.Tokens.Asset
  alias Platform.Market.DailyMarketHistory
  alias Platform.Market.TokenCache.CacheToken

  @doc """
  Returns the search of tokens.

  ## Examples

      iex> search_tokens()
      [%Token{}, ...]

  """
  def search_tokens(q) do
    # TODO
    # query =
    #   Token
    #   |> where([t], like(t.name, ^"%#{String.replace(q, "%", "\\%")}%"))
    #   |> order_by(desc: :inserted_at)
    #
    # Repo.all(query)

    Enum.filter(Asset.portfolio(), fn x -> String.contains?(x.ticker, q) end)
  end

  @doc """
  Returns the list of tokens.

  ## Examples

      iex> list_tokens()
      [%Token{}, ...]

  """
  def list_tokens(params) do
    page = String.to_integer(params["page"])
    per_page = String.to_integer(params["per_page"])

    offset = if page > 1, do: (page - 1) * per_page, else: 0

    q = from(t in Token, limit: ^per_page, offset: ^offset, preload: :topics)

    tokens =
      Repo.preload(Repo.all(q),
        daily_market_history:
          from(daily_market_history in DailyMarketHistory,
            order_by: [desc: daily_market_history.updated_at]
          )
      )

    # update latest

    tokens =
      tokens
      |> Enum.map(fn t ->
        token_data = Platform.Market.TokenCache.lookup(t.symbol)

        case token_data do
          %CacheToken{} ->
            data = Map.from_struct(token_data)

            token_info_changeset =
              CacheToken.changeset(
                %CacheToken{},
                data
              )

            changeset =
              t
              |> Ecto.Changeset.change()
              |> Ecto.Changeset.put_embed(:token_info, token_info_changeset)

            Repo.update!(changeset)

          _ ->
            t
        end
      end)

    tokens
  end

  @doc """
  Gets a single token.

  Raises `Ecto.NoResultsError` if the Token does not exist.

  ## Examples

      iex> get_token!(123)
      %Token{}

      iex> get_token!(456)
      ** (Ecto.NoResultsError)

  """
  def get_token!(id), do: Repo.get!(Token, id)

  @doc """
  Creates a token.

  ## Examples

      iex> create_token(%{field: value})
      {:ok, %Token{}}

      iex> create_token(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_token(attrs \\ %{}) do
    %Token{}
    |> Token.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a token.

  ## Examples

      iex> update_token(token, %{field: new_value})
      {:ok, %Token{}}

      iex> update_token(token, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_token(%Token{} = token, attrs) do
    token
    |> Token.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Token.

  ## Examples

      iex> delete_token(token)
      {:ok, %Token{}}

      iex> delete_token(token)
      {:error, %Ecto.Changeset{}}

  """
  def delete_token(%Token{} = token) do
    Repo.delete(token)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking token changes.

  ## Examples

      iex> change_token(token)
      %Ecto.Changeset{source: %Token{}}

  """
  def change_token(%Token{} = token) do
    Token.changeset(token, %{})
  end
end
