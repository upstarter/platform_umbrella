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
    path: [2, 20, 76]
  },
  %Topic{
    name: "Payment",
    id: 81,
    description: "",
    path: [2, 20, 76]
  },
  %Topic{
    name: "Asset Security",
    id: 82,
    description: "",
    path: [2, 20, 76]
  }
]

utility_topics = [
  %Topic{
    name: "Platform",
    id: 83,
    description: "",
    path: [2, 20, 76, 77]
  },
  %Topic{
    name: "Non-Platform",
    id: 84,
    description: "",
    path: [2, 20, 76, 77]
  },
  %Topic{
    name: "General",
    id: 85,
    description: "",
    path: [2, 20, 76, 77, 81]
  },
  %Topic{
    name: "Defined",
    id: 86,
    description: "",
    path: [2, 20, 76, 77, 81]
  }
]

asset_security_topics = [
  %Topic{
    name: "Collateralized Tokens",
    id: 87,
    description: "",
    path: [2, 20, 76, 79]
  },
  %Topic{
    name: "Tokenized Securities",
    id: 88,
    description: "",
    path: [2, 20, 76, 79]
  },
  %Topic{
    name: "Share-like Tokens",
    id: 89,
    description: "",
    path: [2, 20, 76, 79]
  }
]

payment = [%Topic{name: "Payment", id: 87, description: "", path: [2, 20, 76]}]

fungible_topics = roots ++ utility_topics ++ payment

fungible_topics
|> Enum.map(&Repo.insert!(&1))
