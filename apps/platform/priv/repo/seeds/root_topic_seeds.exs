alias Platform.Repo
alias Platform.Topics.Topic

# BASE TOPICS IN THE UNIVERSE OF DISCOURSE FOR CRYPTOWISE.AI
root_topics = [
  %Topic{
    name: "Crypto Economics",
    id: 1,
    description: "Cryptoeconomics refers to the combinations of cryptography, computer networks
       and game theory which provide secure systems exhibiting some set of economic
       dis/incentives.",
    path: []
  },
  %Topic{
    name: "Cryptoasset Analysis & Research",
    id: 2,
    description:
      "Fundamental, Technical, and Sociotechnical analysis of crypto systems, networks, and assets.",
    path: []
  },
  %Topic{
    name: "Artificial Intelligence and Crypto",
    id: 3,
    description: "Categorical breakdown of the current crop of crypto AI use cases by
      startups and the socio-technical implications of future developments.",
    path: []
  },
  %Topic{
    name: "Crypto Career Development",
    id: 4,
    description: "The current and future professions
      involving crypto technologies and business practices.",
    path: []
  }
]

root_topics
|> Enum.map(&Repo.insert!(&1))
