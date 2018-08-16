defmodule Platform.Topics do
  @moduledoc """
  The Topics context.
  """

  import Ecto.Query, warn: false
  alias Platform.Repo

  alias Platform.Topics.Topic

  @doc """
  Returns the list of topics.

  ## Examples

      iex> list_topics()
      [%Topic{}, ...]

  """
  def list_topics do
    # Repo.all(Topic)

    topics = %{
      "Cryptoeconomics" => {
        short_desc: "Cryptoeconomics refers to the combinations of cryptography, computer networks and game theory which provide secure systems exhibiting some set of economic dis/incentives.",
        long_desc:  "",
      },

      "Decentralized Apps (Dapps)" => {
        short_desc: "A decentralized application (Dapp, dApp or DApp) is an application that is run by many users on a decentralized network with trustless protocols. They are designed to avoid any single point of failure. They typically have tokens to reward users for providing computing power.",
        long_desc:  "",
      },

      "Cryptocurrencies" => {
        short_desc: "A digital currency in which encryption techniques are used to regulate the generation of units of currency and verify the transfer of funds, operating independently of a central bank.",
        long_desc:  "",
      },

      "Regulatory" => {
        short_desc: "A rule or directive made and maintained by an authority.",
        long_desc:  "",
      },

      "Compliance" => {
        short_desc: "The act or process of complying to a desire, demand, proposal, or regimen or to coercion",
        long_desc:  "",
      },

      "CryptoCloud" => {
        short_desc: "Crypto cloud computing is a secure cloud computing architecture. Cloud computing is a large-scale distributed computing model that is driven by economies of scale. It integrates a set of abstracted, virtualized, dynamically-scalable, and managed resources, such as computing power, storage, platforms, and services.",
        long_desc:  "",
      },

      "Sustainability" => {
        short_desc: "Sustainable development is development that meets the needs of the present without compromising the ability of future generations to meet their own needs.",
        long_desc:  "",
      },

      "Network Ownership Effects" => {
        short_desc: "A network ownership effect describes when the utility of the service and the value of ownership of the service increases for existing users when new users join.",
        long_desc:  "",
      },

      "Social Impact" => {
        short_desc: "A significant, positive change that addresses a pressing social challenge.",
        long_desc:  "",
      },

      "ERC-XX" => {
        short_desc: "ERC stands for Ethereum Request for Comments, like the IETF's RFC (https://www.ietf.org/rfc.html). An RFC is authored by engineers and computer scientists in the form of a memorandum describing methods, behaviors, research, or innovations applicable to the working of the Internet and Internet-connected systems. It is submitted either for peer review or to convey new concepts, information, or (occasionally) engineering humor",
        long_desc:  "",
      },

      "Crypto Investment Strategy" => {
        short_desc: "",
        long_desc:  "",
      },

      "Global Tactical Asset Allocation" => {
        short_desc: "",
        long_desc:  "",
      },

      "Trading Systems & Methods" => {
        short_desc: "",
        long_desc:  "",
      },

      "Decentralized Exchanges" => {
        short_desc: "",
        long_desc:  "",
      },

      "Portfolio Optimization" => {
        short_desc: "",
        long_desc:  "",
      },

      "Game Theory" => {
        short_desc: "",
        long_desc:  "",
      },

      "Mechanism Design" => {
        short_desc: "",
        long_desc:  "",
      },

      "Artificial Intelligence" => {
        short_desc: "",
        long_desc:  "",
      },

      "Robotics" => {
        short_desc: "",
        long_desc:  "",
      },

      "Internet of Things" => {
        short_desc: "",
        long_desc:  "",
      },

    }
  end

  @doc """
  Gets a single topic.

  Raises `Ecto.NoResultsError` if the Topic does not exist.

  ## Examples

      iex> get_topic!(123)
      %Topic{}

      iex> get_topic!(456)
      ** (Ecto.NoResultsError)

  """
  def get_topic!(id), do: Repo.get!(Topic, id)

  @doc """
  Creates a topic.

  ## Examples

      iex> create_topic(%{field: value})
      {:ok, %Topic{}}

      iex> create_topic(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_topic(attrs \\ %{}) do
    %Topic{}
    |> Topic.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a topic.

  ## Examples

      iex> update_topic(topic, %{field: new_value})
      {:ok, %Topic{}}

      iex> update_topic(topic, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_topic(%Topic{} = topic, attrs) do
    topic
    |> Topic.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Topic.

  ## Examples

      iex> delete_topic(topic)
      {:ok, %Topic{}}

      iex> delete_topic(topic)
      {:error, %Ecto.Changeset{}}

  """
  def delete_topic(%Topic{} = topic) do
    Repo.delete(topic)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking topic changes.

  ## Examples

      iex> change_topic(topic)
      %Ecto.Changeset{source: %Topic{}}

  """
  def change_topic(%Topic{} = topic) do
    Topic.changeset(topic, %{})
  end
end
