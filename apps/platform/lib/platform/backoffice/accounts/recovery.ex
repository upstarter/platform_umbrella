defmodule Platform.Accounts.Recovery do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:email, :string)
    field(:reset_password_token, :string)
    field(:reset_password_sent_at, :utc_datetime)

    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = recovery) do
    recovery
    |> change(
      reset_password_token: Ecto.UUID.generate(),
      reset_password_sent_at: Timex.now()
    )
  end
end
