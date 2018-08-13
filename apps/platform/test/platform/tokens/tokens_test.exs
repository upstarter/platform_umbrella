defmodule Platform.TokensTest do
  use Platform.DataCase

  alias Platform.Tokens

  describe "tokens" do
    alias Platform.Tokens.Token

    @valid_attrs %{img_url: "some img_url", name: "some name", short_desc: "some short_desc", site: "some site", ticker: "some ticker"}
    @update_attrs %{img_url: "some updated img_url", name: "some updated name", short_desc: "some updated short_desc", site: "some updated site", ticker: "some updated ticker"}
    @invalid_attrs %{img_url: nil, name: nil, short_desc: nil, site: nil, ticker: nil}

    def token_fixture(attrs \\ %{}) do
      {:ok, token} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tokens.create_token()

      token
    end

    test "list_tokens/0 returns all tokens" do
      token = token_fixture()
      assert Tokens.list_tokens() == [token]
    end

    test "get_token!/1 returns the token with given id" do
      token = token_fixture()
      assert Tokens.get_token!(token.id) == token
    end

    test "create_token/1 with valid data creates a token" do
      assert {:ok, %Token{} = token} = Tokens.create_token(@valid_attrs)
      assert token.img_url == "some img_url"
      assert token.name == "some name"
      assert token.short_desc == "some short_desc"
      assert token.site == "some site"
      assert token.ticker == "some ticker"
    end

    test "create_token/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tokens.create_token(@invalid_attrs)
    end

    test "update_token/2 with valid data updates the token" do
      token = token_fixture()
      assert {:ok, token} = Tokens.update_token(token, @update_attrs)
      assert %Token{} = token
      assert token.img_url == "some updated img_url"
      assert token.name == "some updated name"
      assert token.short_desc == "some updated short_desc"
      assert token.site == "some updated site"
      assert token.ticker == "some updated ticker"
    end

    test "update_token/2 with invalid data returns error changeset" do
      token = token_fixture()
      assert {:error, %Ecto.Changeset{}} = Tokens.update_token(token, @invalid_attrs)
      assert token == Tokens.get_token!(token.id)
    end

    test "delete_token/1 deletes the token" do
      token = token_fixture()
      assert {:ok, %Token{}} = Tokens.delete_token(token)
      assert_raise Ecto.NoResultsError, fn -> Tokens.get_token!(token.id) end
    end

    test "change_token/1 returns a token changeset" do
      token = token_fixture()
      assert %Ecto.Changeset{} = Tokens.change_token(token)
    end
  end
end
