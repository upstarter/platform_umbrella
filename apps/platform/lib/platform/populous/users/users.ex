defmodule Platform.Users do
  @moduledoc """

    The Users context.

  """

  import Ecto.Query, warn: false
  import Ecto.Changeset
  alias Platform.Repo

  alias Platform.Users.User
  alias Platform.Users.Profiles.Role
  alias Platform.Users.Profiles.UserRole

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def update_role(user, role, is_role) do
    role = Repo.get_by!(Role, title: role)
    user = user |> Repo.preload(:user_profile)

    user_role =
      Repo.get_by(UserRole,
        user_id: user.id,
        role_id: role.id,
        user_profile_id: user.user_profile.id
      )
      |> Repo.preload([:user, :role, :user_profile])

    attrs = %{
      user_id: user.id,
      role_id: role.id,
      user_profile_id: user.user_profile.id,
      active: is_role
    }

    # require IEx
    # IEx.pry()

    user_role =
      if user_role do
        user_role
        |> UserRole.changeset(attrs)
        |> Repo.update!()
      else
        %UserRole{}
        |> UserRole.changeset(attrs)
        |> Repo.insert!()
      end

    user =
      Repo.one(
        from(u in User,
          where: u.id == ^user.id,
          join: ur in UserRole,
          on: u.id == ur.user_id,
          where: ur.active == true,
          join: r in Role,
          on: r.id == ur.role_id,
          preload: [roles: r]
        )
      )

    # require IEx
    # IEx.pry()

    {:ok, user}
  end

  def roles(user) do
    Repo.one(
      from(u in User,
        where: u.id == ^user.id,
        join: ur in UserRole,
        on: u.id == ur.user_id,
        where: ur.active == true,
        join: r in Role,
        on: r.id == ur.role_id,
        preload: [roles: r]
      )
    )
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end
end
