alias Platform.Repo
alias Platform.Topics.Topic

# TAXONOMY OF CRYPTOASSETS 2018
taxonomy_root_topics = [
  %Topic{
    name: "Non-Fungibles",
    id: 72,
    description: "",
    path: [2, 20]
  },
  %Topic{
    name: "Personal",
    id: 73,
    description: "Utility",
    path: [2, 20, 72]
  },
  %Topic{
    name: "Identity",
    id: 74,
    description: "Utility",
    path: [2, 20, 73]
  },
  %Topic{
    name: "Reputation",
    id: 75,
    description: "Utility",
    path: [2, 20, 73]
  },
  %Topic{
    name: "Non-Personal",
    id: 76,
    description: "",
    path: [2, 20, 72]
  },
  %Topic{
    name: "Collectibles",
    id: 77,
    description: "Utility",
    path: [2, 20, 74]
  },
  %Topic{
    name: "Membership",
    id: 78,
    description: "",
    path: [2, 20, 74]
  }
]

taxonomy_root_topics
|> Enum.map(&Repo.insert!(&1))
