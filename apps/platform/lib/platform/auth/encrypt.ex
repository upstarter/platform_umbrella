defmodule Auth.Accounts.Encrypt do
  @moduledoc """

    used by backoffice too

  """

  alias Comeonin.Bcrypt

  def password_hashing(password), do: Bcrypt.hashpwsalt(password)
  def validate_password(password, hash), do: Bcrypt.checkpw(password, hash)
end
