alias Platform.Repo
alias Platform.Topics.Topic

# TAXONOMY OF CRYPTOASSETS 2018
roots = [
  %Topic{
    name: "Fungibles",
    id: 79,
    description: "",
    path: [2, 20]
  },
  %Topic{
    name: "Utility",
    id: 80,
    description: "",
    path: [2, 20, 79]
  },
  %Topic{
    name: "Payment",
    id: 81,
    description: "",
    path: [2, 20, 79]
  },
  %Topic{
    name: "Asset Security",
    id: 82,
    description: "",
    path: [2, 20, 79]
  }
]

utility_topics = [
  %Topic{
    name: "Platform",
    id: 83,
    description: "",
    path: [2, 20, 79, 80]
  },
  %Topic{
    name: "Non-Platform",
    id: 84,
    description: "",
    path: [2, 20, 79, 80]
  },
  %Topic{
    name: "General",
    id: 85,
    description: "",
    path: [2, 20, 79, 80, 84]
  },
  %Topic{
    name: "Defined",
    id: 86,
    description: "",
    path: [2, 20, 79, 80, 84]
  }
]

asset_security_topics = [
  %Topic{
    name: "Collateralized Tokens",
    id: 87,
    description: "",
    path: [2, 20, 79, 82]
  },
  %Topic{
    name: "Tokenized Securities",
    id: 88,
    description: "",
    path: [2, 20, 79, 82]
  },
  %Topic{
    name: "Share-like Tokens",
    id: 89,
    description: "",
    path: [2, 20, 79, 82]
  }
]

payment = [%Topic{name: "Payment", id: 117, description: "", path: [2, 20, 79, 81]}]

fungible_topics = roots ++ utility_topics ++ asset_security_topics ++ payment

fungible_topics
|> Enum.map(&Repo.insert!(&1))
