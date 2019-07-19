alias Platform.Repo
alias Platform.Topics.Topic
# current available id is 124
# BASE TOPICS IN THE UNIVERSE OF DISCOURSE FOR CRYPTOWISE.AI
root_topics = [
  %Topic{
    name: "Crypto Economics",
    id: 1,
    description: "Cryptoeconomics refers to the combinations of cryptography, computer networks
       and game theory which provide secure systems exhibiting some set of economic
       dis/incentives.",
    parent_id: nil
  },
  %Topic{
    name: "Cryptoasset Analysis",
    id: 2,
    description:
      "Fundamental, Technical, and Sociotechnical analysis of crypto systems, networks, and assets.",
    parent_id: nil
  },
  %Topic{
    name: "Artificial Intelligence",
    id: 3,
    description: "Categorical breakdown of the current crop of crypto AI use cases by
      startups and the socio-technical implications of future developments.",
    parent_id: nil
  },
  %Topic{
    name: "Behavioral Finance & Investing Psychology",
    id: 111,
    description: "Psychological and Technosocial aspects of financial & capital markets.",
    parent_id: nil
  },
  %Topic{
    name: "Crypto Career Development",
    id: 4,
    description: "The current and future titles and roles
      involving crypto technologies and business practices.",
    parent_id: nil
  },
  %Topic{
    name: "Research",
    id: 123,
    description: "The frontiers of the CryptoCosm",
    parent_id: nil
  }
]

root_topics
|> Enum.map(&Repo.insert!(&1))

#
# Enum.map(root_topics, fn topic ->
#   changeset = Topic.changeset(%Topic{}, topic)
#   Repo.insert(changeset)
# end)
