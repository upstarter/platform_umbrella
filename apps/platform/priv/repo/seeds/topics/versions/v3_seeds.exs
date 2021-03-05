alias Platform.Repo
alias Platform.Topics.Topic
alias Platform.Tokens.Token
#
# current available id is  v3: 198
v3_topics = [
  %Topic{
    name: "Curation Markets",
    id: 194,
    description: "",
    parent_id: 10
  },
  %Topic{
    name: "Token Bonding Curves",
    id: 195,
    description: "",
    parent_id: 10
  },
  %Topic{
    name: "Token Curated Registries",
    id: 196,
    description: "",
    parent_id: 10
  },
  %Topic{
    name: "MarketPlaces",
    id: 197,
    description: "",
    parent_id: 14
  },
  %Topic{
    name: "Computing Services",
    id: 198,
    description: "",
    parent_id: 14
  },
  %Topic{
    name: "Hedge Funds",
    id: 199,
    description: "",
    parent_id: 14
  },
  %Topic{
    name: "Stock Trading",
    id: 200,
    description: "",
    parent_id: 14
  },
  %Topic{
    name: "Options Trading",
    id: 200,
    description: "",
    parent_id: 14
  },
  %Topic{
    name: "Futures Trading",
    id: 200,
    description: "",
    parent_id: 14
  },
  %Topic{
    name: "Currency Trading",
    id: 200,
    description: "",
    parent_id: 14
  },
  %Topic{
    name: "",
    id: 200,
    description: "",
    parent_id: 14
  },
  %Topic{
    name: "",
    id: 200,
    description: "",
    parent_id: 14
  }
]

v3_topics
|> Enum.map(&Repo.insert!(&1))
