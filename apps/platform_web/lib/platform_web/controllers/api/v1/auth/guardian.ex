defmodule PlatformWeb.Auth.Guardian do
  use Guardian, otp_app: :platform_web
  alias Platform.Auth.Credential
  alias Platform.Users.User

  # You can use any value for the subject of your token but
  # it should be useful in retrieving the resource later, see
  # how it being used on `resource_from_claims/1` function.
  # A unique `id` is a good subject, a non-unique email address
  # is a poor subject.
  def subject_for_token(%User{id: user_id}, _claims) do
    {:ok, to_string(user_id)}
  end

  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(%{"sub" => user_id}) do
    user = Platform.Repo.get!(User, user_id)

    {:ok, user}
  end

  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end

  @impl true
  def after_sign_in(conn, resource, _token, _claims, _opts) do
    # GuardianTrackable.track!(Platform.Repo, resource, conn.remote_ip)
    {:ok, conn}
  end
end
