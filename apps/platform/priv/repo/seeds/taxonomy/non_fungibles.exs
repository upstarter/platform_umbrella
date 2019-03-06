alias Platform.Repo
alias Platform.Topics.Topic

# TAXONOMY OF CRYPTOASSETS 2018
taxonomy_root_topics = [
  %Topic{
    name: "Non-Fungibles",
    id: 72,
    description: "",
    parent_id: 20
  },
  %Topic{
    name: "Personal",
    id: 73,
    description: "Utility",
    parent_id: 72
  },
  %Topic{
    name: "Identity",
    id: 74,
    description: "Utility",
    parent_id: 73
  },
  %Topic{
    name: "Reputation",
    id: 75,
    description: "Utility",
    parent_id: 73
  },
  %Topic{
    name: "Non-Personal",
    id: 76,
    description: "",
    parent_id: 72
  },
  %Topic{
    name: "Collectibles",
    id: 77,
    description: "Utility",
    parent_id: 76
  },
  %Topic{
    name: "Membership",
    id: 78,
    description: "",
    parent_id: 76
  }
]

taxonomy_root_topics
|> Enum.map(&Repo.insert!(&1))
