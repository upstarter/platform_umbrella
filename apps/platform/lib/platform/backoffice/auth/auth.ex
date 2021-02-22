defmodule Platform.Auth do
  alias Platform.Auth.Credential
  alias Platform.Accounts.Account
  alias Platform.Users.User
  alias Platform.Repo
  # alias Platform.Auth.TokenSerializer

  import Argon2, only: [verify_pass: 2]

  def create_account(params) do
    converted_params = convert_params(params)

    # with Account.register(converted_params) do
    #   {:ok, acct} -> this
    #   {:error, changeset } -> that
    # end
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

    # IO.inspect(['^^^^^^^^^^^^^^', user_info])
    {:ok, user_info}
  end

  def new_session(
        session = %{
          "session" => %{"email" => email, "password" => pass, "remember" => _remember}
        }
      ) do
    email_password_auth(email, pass)
  end

  def get_by_email(email) do
    case Repo.get_by(User, email: email) do
      nil ->
        nil

      user ->
        user = user |> Repo.preload([:credentials])
        pwd_cred = for c <- user.credentials, is_pwd_cred?(c), do: c

        {:ok, List.last(pwd_cred)}
    end
  end

  defp email_password_auth(email, pass) when is_binary(email) and is_binary(pass) do
    with {:ok, cred} <- get_by_email(email) do
      verify_password(pass, cred)
    else
      _ ->
        {:error, :user_not_found}
    end
  end

  defp verify_password(password, %Credential{} = cred) when is_binary(password) do
    if verify_pass(password, cred.token) do
      {:ok, cred}
    else
      {:error, :invalid_password}
    end
  end

  defp verify_password(_password), do: {:error, :invalid_password}

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
