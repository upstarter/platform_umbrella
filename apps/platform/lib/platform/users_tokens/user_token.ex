defmodule Platform.UsersTokens.UserToken do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users_tokens" do
    field :token_id, :integer
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(user_token, attrs) do
    user_token
    |> cast(attrs, [:user_id, :token_id])
    |> validate_required([:user_id, :token_id])
  end
end
