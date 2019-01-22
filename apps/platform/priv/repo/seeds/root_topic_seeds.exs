alias Platform.Repo
alias Platform.Topics.Topic
# current id is 113
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
    name: "Artificial Intelligence",
    id: 3,
    description: "Categorical breakdown of the current crop of crypto AI use cases by
      startups and the socio-technical implications of future developments.",
    path: []
  },
  %Topic{
    name: "Behavioral Finance & Investing Psychology",
    id: 111,
    description:
      "Psychological and Technosocial aspects of financial & capital market participation.",
    path: []
  },
  %Topic{
    name: "Crypto Career Development",
    id: 4,
    description: "The current and future titles and roles
      involving crypto technologies and business practices.",
    path: []
  }
]

root_topics
|> Enum.map(&Repo.insert!(&1))
