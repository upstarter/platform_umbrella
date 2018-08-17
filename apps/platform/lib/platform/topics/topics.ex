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

      iex> list_topics() [%Topic{}, ...]

  """

  def list_topics do
    # Repo.all(Topic)

    topics = [
      %Topic{
        name: "Cryptoeconomics",
        id: 1,
        short_desc: "Cryptoeconomics refers to the combinations of cryptography, computer
      networks and game theory which provide secure systems exhibiting some set of
      economic dis/incentives.",
        long_desc: ""
      },
      %Topic{
        name: "Decentralized Apps (Dapps)",
        id: 2,
        short_desc: "A decentralized application (Dapp, dApp or DApp) is an application that
      is run by many users on a decentralized network with trustless protocols.
      They are designed to avoid any single point of failure. They typically
      have tokens to reward users for providing computing power.",
        long_desc: ""
      },
      %Topic{name: "Cryptocurrencies", id: 3, short_desc: "A
      digital currency in which encryption techniques are used to regulate the
      generation of units of currency and verify the transfer of funds,
      operating independently of a central bank.", long_desc: ""},
      %Topic{name: "Regulatory", id: 4, short_desc: "A rule or
      directive made and maintained by an authority.", long_desc: ""},
      %Topic{name: "Compliance", id: 20, short_desc: "The act or
      process of complying to a desire, demand, proposal, or regimen or to
      coercion", long_desc: ""},
      %Topic{name: "CryptoCloud", id: 5, short_desc: "Crypto cloud
      computing is a secure cloud computing architecture. Cloud computing is a
      large-scale distributed computing model that is driven by economies of
      scale. It integrates a set of abstracted, virtualized,
      dynamically-scalable, and managed resources, such as computing power,
      storage, platforms, and services.", long_desc: ""},
      %Topic{
        name: "Sustainability",
        id: 6,
        short_desc: "Sustainable development is development that meets the needs of the
      present without compromising the ability of future generations to meet
      their own needs.",
        long_desc: ""
      },
      %Topic{
        name: "Network Ownership Effects",
        id: 7,
        short_desc: "A network ownership effect describes when the utility of the service and
      the value of ownership of the service increases for existing users when
      new users join.",
        long_desc: ""
      },
      %Topic{name: "Social Impact", id: 8, short_desc: "A
      significant, positive change that addresses a pressing social challenge.", long_desc: ""},
      %Topic{name: "ERC-XX", id: 9, short_desc: "ERC stands for
      Ethereum Request for Comments, like the IETF's RFC
      (https://www.ietf.org/rfc.html). An RFC is authored by engineers and
      computer scientists in the form of a memorandum describing methods,
      behaviors, research, or innovations applicable to the working of the
      Internet and Internet-connected systems. It is submitted either for peer
      review or to convey new concepts, information, or (occasionally)
      engineering humor", long_desc: ""},
      %Topic{
        name: "Crypto Investment Strategy",
        id: 10,
        short_desc: "",
        long_desc: ""
      },
      %Topic{
        name: "Global Tactical Asset Allocation",
        id: 11,
        short_desc: "",
        long_desc: ""
      },
      %Topic{
        name: "Trading Systems & Methods",
        id: 12,
        short_desc: "",
        long_desc: ""
      },
      %Topic{name: "Decentralized Exchanges", id: 13, short_desc: "", long_desc: ""},
      %Topic{name: "Portfolio Optimization", id: 14, short_desc: "", long_desc: ""},
      %Topic{name: "Game Theory", id: 15, short_desc: "", long_desc: ""},
      %Topic{name: "Mechanism Design", id: 16, short_desc: "", long_desc: ""},
      %Topic{name: "Artificial Intelligence", id: 17, short_desc: "", long_desc: ""},
      %Topic{name: "Robotics", id: 18, short_desc: "", long_desc: ""},
      %Topic{name: "Internet of Things", id: 19, short_desc: "", long_desc: ""}
    ]

    topics
  end

  @doc """

  Gets a single topic.

  Raises `Ecto.NoResultsError` if the Topic does not exist.

  ## Examples

      iex> get_topic!(123) %Topic{}

      iex> get_topic!(456) ** (Ecto.NoResultsError)

  """

  def get_topic!(id), do: Repo.get!(Topic, id)

  @doc """

  Creates a topic.

  ## Examples

      iex> create_topic(%{field: value}) {:ok, %Topic{}}

      iex> create_topic(%{field: bad_value}) {:error, %Ecto.Changeset{}}

  """

  def create_topic(attrs \\ %{}) do
    %Topic{}
    |> Topic.changeset(attrs)
    |> Repo.insert()
  end

  @doc """

  Updates a topic.

  ## Examples

      iex> update_topic(topic, %{field: new_value}) {:ok, %Topic{}}

      iex> update_topic(topic, %{field: bad_value}) {:error, %Ecto.Changeset{}}

  """

  def update_topic(%Topic{} = topic, attrs) do
    topic |> Topic.changeset(attrs) |> Repo.update()
  end

  @doc """

  Deletes a Topic.

  ## Examples

      iex> delete_topic(topic) {:ok, %Topic{}}

      iex> delete_topic(topic) {:error, %Ecto.Changeset{}}

  """

  def delete_topic(%Topic{} = topic) do
    Repo.delete(topic)
  end

  @doc """

  Returns an `%Ecto.Changeset{}` for tracking topic changes.

  ## Examples

      iex> change_topic(topic) %Ecto.Changeset{source: %Topic{}}

  """

  def change_topic(%Topic{} = topic) do
    Topic.changeset(topic, %{})
  end
end
