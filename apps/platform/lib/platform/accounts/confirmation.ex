defmodule Platform.Accounts.Confirmation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:email, :string)
    field(:confirmation_sent_at, Timex.Ecto.DateTime)
    field(:confirmation_token, :string)
    field(:confirmed_at, Timex.Ecto.DateTime)

    timestamps()
  end

  def send_changeset(%__MODULE__{} = data) do
    data
    |> change(
      confirmation_token: Ecto.UUID.generate(),
      confirmation_sent_at: Timex.now()
    )
  end

  def confirmed_changeset(%__MODULE__{} = data) do
    change(data, confirmed_at: Timex.now())
  end

  @doc false
  def changeset(confirmation, attrs) do
    confirmation
    |> cast(attrs, [:email, :confirmation_token, :confirmation_sent_at, :confirmed_at])
    |> validate_required([:email, :confirmation_token, :confirmation_sent_at, :confirmed_at])
  end
end
