alias Platform.Repo
alias Platform.Topics.Topic

macroecon_topics = [
  # parent
  %Topic{
    name: "Macro Economy",
    id: 5,
    description: "The Crypto Economy. A.K.A 'The Cryptocosm'. Includes crypto
    economic sectors and their analysis.",
    parent_id: 1
  },
  # children
  %Topic{
    name: "Crypto Economic Sectors",
    id: 6,
    description: "The sectors of the crypto economy.",
    parent_id: 5
  }
]

macroecon_topics
|> Enum.map(&Repo.insert!(&1))
