alias Platform.Repo
alias Platform.Topics.Topic

# TAXONOMY OF CRYPTOASSETS 2018
roots = [
  %Topic{
    name: "Fungibles",
    id: 79,
    description: "",
    parent_id: 20
  },
  %Topic{
    name: "Utility",
    id: 80,
    description: "",
    parent_id: 79
  },
  %Topic{
    name: "Payment",
    id: 81,
    description: "",
    parent_id: 79
  },
  %Topic{
    name: "Asset Security",
    id: 82,
    description: "",
    parent_id: 79
  }
]

utility_topics = [
  %Topic{
    name: "Platform",
    id: 83,
    description: "",
    parent_id: 80
  },
  %Topic{
    name: "Non-Platform",
    id: 84,
    description: "",
    parent_id: 80
  },
  %Topic{
    name: "General",
    id: 85,
    description: "",
    parent_id: 84
  },
  %Topic{
    name: "Defined",
    id: 86,
    description: "",
    parent_id: 84
  }
]

asset_security_topics = [
  %Topic{
    name: "Collateralized Tokens",
    id: 87,
    description: "",
    parent_id: 82
  },
  %Topic{
    name: "Tokenized Securities",
    id: 88,
    description: "",
    parent_id: 82
  },
  %Topic{
    name: "Share-like Tokens",
    id: 89,
    description: "",
    parent_id: 82
  }
]

fungible_topics = roots ++ utility_topics ++ asset_security_topics

fungible_topics
|> Enum.map(&Repo.insert!(&1))
