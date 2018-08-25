defmodule Platform.Auth.TokenSerializer do
  use Guardian, otp_app: :platform
  alias Platform.Auth.Account

  # You can use any value for the subject of your token but
  # it should be useful in retrieving the resource later, see
  # how it being used on `resource_from_claims/1` function.
  # A unique `id` is a good subject, a non-unique email address
  # is a poor subject.
  def subject_for_token(%Account{id: auth_account_id}, _claims) do
    {:ok, to_string(auth_account_id)}
  end

  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(%{"sub" => auth_account_id}) do
    {:ok, Platform.Repo.get!(Account, auth_account_id)}
  end

  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end
end
