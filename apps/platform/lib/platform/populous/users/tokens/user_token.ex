defmodule Platform.Users.Tokens.UserToken do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users_tokens" do
    belongs_to(:user, Platform.Users.User)
    belongs_to(:token, Platform.Tokens.Token)

    timestamps()
  end

  @doc false
  def changeset(user_token, attrs) do
    user_token
    |> cast(attrs, [:user_id, :token_id])
    |> validate_required([:user_id, :token_id])
  end
end
