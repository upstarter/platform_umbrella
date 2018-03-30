defmodule Users.User do
  use Users.Model

  schema "users" do
    field :username, :string
    field :email, :string
    field :auth_account_id, :integer

    # belongs_to :wallet, Ledger.Account

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, ~w(username email)a)
    |> validate_required(~w(username email)a)
    |> unique_constraint(:username)
  end

  def build(%{username: username} = params) do
    changeset(%User{}, params)
    # |> put_assoc(:wallet, Ledger.Account.build_wallet("Wallet: #{username}"))
  end
end
