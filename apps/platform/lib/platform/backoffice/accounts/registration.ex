defmodule Platform.Accounts.Registration do
  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Accounts.Registration
  alias Platform.Users.User
  # duplication from other models, but registrar's need this
  # reflect fields on the form
  embedded_schema do
    field(:source, :string)
    field(:email, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:password, :string)
    field(:token, :string)
    field(:terms_accepted, :boolean, default: false)
  end

  # validate and insert
  def create(%Ecto.Multi{} = multi, params) do
    multi
    |> Ecto.Multi.run(:registration, __MODULE__, :validate_registration, [params])
    |> Ecto.Multi.run(:user, __MODULE__, :insert_user, [params])
    |> Ecto.Multi.run(:user_topics, __MODULE__, :insert_user_topics, [params])
    |> Ecto.Multi.run(:credential, __MODULE__, :insert_credential, [params])
    |> Ecto.Multi.run(:account, __MODULE__, :insert_account, [params])
  end

  def insert_user(Platform.Repo, _changes, params) do
    %User{}
    |> User.registration_changeset(params)
    |> Platform.Repo.insert()
  end

  def insert_user_topics(Platform.Repo, %{user: user}, params) do
    user_topics =
      for topic_id <- params.topic_knowledge_ids,
          do: %{
            topic_id: topic_id,
            user_id: user.id,
            inserted_at: Timex.now(),
            updated_at: Timex.now()
          }

    {num_topics, u_topics} = Platform.Repo.insert_all("users_topics", user_topics)

    if num_topics > 0 do
      {:ok, u_topics}
    else
      {:error, "topics not inserted"}
    end
  end

  def insert_credential(Platform.Repo, %{user: user}, params) do
    user
    |> Ecto.build_assoc(:credentials, source: params[:source])
    |> Platform.Auth.Credential.changeset(params)
    # ok or error tuple instructs Ecto.Multi how to proceed
    |> Platform.Repo.insert()
  end

  # if either earlier step in insertion fails, this never runs
  def insert_account(Platform.Repo, %{user: user}, params) do
    user
    |> Ecto.build_assoc(:accounts)
    |> Platform.Accounts.Account.changeset(params)
    # ok or error tuple instructs Ecto.Multi how to proceed
    |> Platform.Repo.insert()
  end

  def validate_registration(multi, _changes, params) do
    changeset = changeset(%__MODULE__{}, params)

    if changeset.valid? do
      {:ok, changeset}
    else
      {:error, apply_action(changeset, :insert)}
    end
  end

  @doc "Reg Validation level 1 - basic"
  def changeset(registration, params \\ %{}) do
    registration
    |> cast(params, [
      :source,
      :first_name,
      :last_name,
      :email,
      :password,
      :token,
      :terms_accepted
    ])
    |> User.validate()
    |> Platform.Auth.Credential.validate()

    # |> validate_acceptance(:terms_accepted)
  end
end
