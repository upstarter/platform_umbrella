defmodule Platform.Auth do
  alias Platform.Auth.Credential
  alias Platform.Accounts.Account
  alias Platform.Users.User
  alias Platform.Repo
  # alias Platform.Auth.TokenSerializer

  import Comeonin.Argon2, only: [checkpw: 2, dummy_checkpw: 0]

  def create_account(params) do
    converted_params = convert_params(params)

    # returns {:ok, account} or {:error, changeset }
    {:ok, acct} = Account.register(converted_params)
    acct = acct |> Repo.preload(:user)
    user = acct.user |> Repo.preload([:credentials, :topics, :groups])
    u = Map.from_struct(user)
    filters = [:id, :email, :topics, :groups, :credentials]

    user_info =
      Enum.filter(u, fn {k, _} ->
        Enum.member?(filters, k)
      end)
      |> Enum.into(%{})

    IO.inspect(['^^^^^^^^^^^^^^', user_info])
    {:ok, user_info}
  end

  def token_sign_in(conn, email, password) do
    case email_password_auth(email, password) do
      {:ok, auth} ->
        IO.puts("$$$$")
        Guardian.Plug.sign_in(conn, auth)

      _ ->
        {:error, :unauthorized}
    end
  end

  defp email_password_auth(email, password) when is_binary(email) and is_binary(password) do
    with {:ok, cred} <- get_by_email(email),
         do: verify_password(password, cred)
  end

  defp verify_password(password, %Credential{} = cred) when is_binary(password) do
    if checkpw(password, cred.token) do
      {:ok, cred}
    else
      {:error, :invalid_password}
    end
  end

  defp get_by_email(email) when is_binary(email) do
    case get_credential(email) do
      nil ->
        dummy_checkpw()
        {:error, "Login error."}

      cred ->
        {:ok, cred}
    end
  end

  def find_and_confirm_password(email, password) do
    case get_credential(email) do
      nil ->
        {:error, :login_not_found}

      cred ->
        if Argon2.check_pass(password, cred.token) do
          {:ok, cred}
        else
          {:error, :login_failed}
        end
    end
  end

  def get_credential(email, password \\ nil) do
    case Repo.get_by(User, email: email) do
      nil ->
        nil

      user ->
        user = user |> Repo.preload([:credentials])
        pwd_cred = for c <- user.credentials, is_pwd_cred?(c), do: c
        List.last(pwd_cred) || nil
    end
  end

  def is_pwd_cred?(c) do
    if c.source == "password" do
      true
    else
      false
    end
  end

  def convert_params(params) do
    for {key, val} <- params, into: %{source: "password"}, do: {String.to_atom(key), val}
  end
end
