alias Platform.Repo
alias Platform.Topics.Topic

macroecon_topics = [
  # parent
  %Topic{
    name: "Macro Economy",
    id: 5,
    description: "The Crypto Economy. A.K.A 'The Cryptocosm'.",
    path: [1]
  },
  # children
  %Topic{
    name: "Crypto Economic Sectors",
    id: 6,
    description: "The sectors of the crypto economy.",
    path: [1, 5]
  }
]

macroecon_topics
|> Enum.map(&Repo.insert!(&1))
