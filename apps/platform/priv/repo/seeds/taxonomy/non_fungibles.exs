alias Platform.Repo
alias Platform.Topics.Topic

# TAXONOMY OF CRYPTOASSETS 2018
taxonomy_root_topics = [
  %Topic{
    name: "Non-Fungible Tokens",
    id: 72,
    description: "Tokens that are unique and hence not interchangeable with any other
token. Do not need a central counterparty to confirm their authenticity.",
    parent_id: 20
  },
  %Topic{
    name: "Personal Tokens",
    id: 73,
    description:
      "Non Fungible Tokens that pertain to an attribute which is specific to a single entity; not
merely tokens that are unique, but tokens that are unique to a unique person, such as reputation and identity.",
    parent_id: 72
  },
  %Topic{
    name: "Identity Tokens",
    id: 74,
    description: "Digital assets that represent the identity of specific individuals.",
    parent_id: 73
  },
  %Topic{
    name: "Reputation Tokens",
    id: 75,
    description: "Digital assets that represent the reputation of specific individuals.",
    parent_id: 73
  },
  %Topic{
    name: "Non-Personal Tokens",
    id: 76,
    description: "NFTs that are not unique to a particular entity",
    parent_id: 72
  },
  %Topic{
    name: "Collectible Tokens",
    id: 77,
    description:
      "Tokens which are unique and not interchangeable with any other token can be digitally scarce and attract the
    attention of collectors.",
    parent_id: 76
  },
  %Topic{
    name: "Membership Tokens",
    id: 78,
    description: "NFT's that represent membership in some collective entity.",
    parent_id: 76
  }
]

taxonomy_root_topics
|> Enum.map(&Repo.insert!(&1))
