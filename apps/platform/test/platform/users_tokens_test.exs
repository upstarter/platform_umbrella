defmodule Platform.UsersTokensTest do
  use Platform.DataCase

  alias Platform.UsersTokens

  describe "users_tokens" do
    alias Platform.UsersTokens.UserToken

    @valid_attrs %{token_id: 42, user_id: 42}
    @update_attrs %{token_id: 43, user_id: 43}
    @invalid_attrs %{token_id: nil, user_id: nil}

    def user_token_fixture(attrs \\ %{}) do
      {:ok, user_token} =
        attrs
        |> Enum.into(@valid_attrs)
        |> UsersTokens.create_user_token()

      user_token
    end

    test "list_users_tokens/0 returns all users_tokens" do
      user_token = user_token_fixture()
      assert UsersTokens.list_users_tokens() == [user_token]
    end

    test "get_user_token!/1 returns the user_token with given id" do
      user_token = user_token_fixture()
      assert UsersTokens.get_user_token!(user_token.id) == user_token
    end

    test "create_user_token/1 with valid data creates a user_token" do
      assert {:ok, %UserToken{} = user_token} = UsersTokens.create_user_token(@valid_attrs)
      assert user_token.token_id == 42
      assert user_token.user_id == 42
    end

    test "create_user_token/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = UsersTokens.create_user_token(@invalid_attrs)
    end

    test "update_user_token/2 with valid data updates the user_token" do
      user_token = user_token_fixture()
      assert {:ok, %UserToken{} = user_token} = UsersTokens.update_user_token(user_token, @update_attrs)
      assert user_token.token_id == 43
      assert user_token.user_id == 43
    end

    test "update_user_token/2 with invalid data returns error changeset" do
      user_token = user_token_fixture()
      assert {:error, %Ecto.Changeset{}} = UsersTokens.update_user_token(user_token, @invalid_attrs)
      assert user_token == UsersTokens.get_user_token!(user_token.id)
    end

    test "delete_user_token/1 deletes the user_token" do
      user_token = user_token_fixture()
      assert {:ok, %UserToken{}} = UsersTokens.delete_user_token(user_token)
      assert_raise Ecto.NoResultsError, fn -> UsersTokens.get_user_token!(user_token.id) end
    end

    test "change_user_token/1 returns a user_token changeset" do
      user_token = user_token_fixture()
      assert %Ecto.Changeset{} = UsersTokens.change_user_token(user_token)
    end
  end
end
