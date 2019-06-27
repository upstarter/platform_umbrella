defmodule Platform.Auth do
  alias Platform.Accounts.Account
  alias Platform.Repo
  # alias Platform.Auth.TokenSerializer

  import Comeonin.Argon2, only: [checkpw: 2, dummy_checkpw: 0]

  def create_account(params) do
    converted_params = convert_params(params["auth"])
    IO.inspect(['converted_params', converted_params])
    account = Account.register(converted_params)
    # act = Platform.Repo.insert!(account)
    {:ok, account}
  end

  def convert_params(params) do
    for {key, val} <- params, into: %{source: "password"}, do: {String.to_atom(key), val}
  end

  def token_sign_in(conn, email, password) do
    IO.inspect(email)

    case email_password_auth(email, password) do
      {:ok, auth} ->
        IO.puts("$$$$")
        Guardian.Plug.sign_in(conn, auth)

      _ ->
        {:error, :unauthorized}
    end
  end

  defp email_password_auth(email, password) when is_binary(email) and is_binary(password) do
    with {:ok, auth} <- get_by_email(email),
         do: verify_password(password, auth)
  end

  defp verify_password(password, %Account{} = auth) when is_binary(password) do
    if checkpw(password, auth.password_hash) do
      {:ok, auth}
    else
      {:error, :invalid_password}
    end
  end

  defp get_by_email(email) when is_binary(email) do
    case Repo.get_by(Account, email: email) do
      nil ->
        dummy_checkpw()
        {:error, "Login error."}

      auth ->
        {:ok, auth}
    end
  end

  def find_and_confirm_password(email, password) do
    case Repo.get_by(Account, email: email) do
      nil ->
        {:error, :login_not_found}

      auth ->
        if Comeonin.Argon2.checkpw(password, auth.password_hash) do
          {:ok, auth}
        else
          {:error, :login_failed}
        end
    end
  end
end
