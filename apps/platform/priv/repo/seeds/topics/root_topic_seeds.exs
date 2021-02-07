alias Platform.Repo
alias Platform.Topics.Topic
# latest available id is available in newest version x_root_topic file
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
    name: "Cryptoasset Fundamental & Technical Analysis",
    id: 2,
    description:
      "Fundamental, Technical, and Sociotechnical analysis of crypto systems, networks, and assets.",
    parent_id: nil
  },
  %Topic{
    name: "Artificial Intelligence",
    id: 3,
    description: "Categorical breakdown of the current crop of key AI use cases by
      startups and the socio-technological implications of future developments.",
    parent_id: nil
  },
  %Topic{
    name: "Behavioral Finance & Investing Psychology",
    id: 111,
    description: "Psychological and Socio-technological aspects of financial & capital markets.",
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
    name: "Crypto Research",
    id: 123,
    description: "The companies & research driving the frontiers of the CryptoCosm.",
    parent_id: nil
  },
  %Topic{
    name: "Quantum Computing",
    id: 124,
    description: "The companies & research driving future directions in Quantum Computing.",
    parent_id: nil
  },
  %Topic{
    name: "CRISPR",
    id: 125,
    description:
      "The companies & research driving future directions in CRISPR gene editing technology.",
    parent_id: nil
  },
  %Topic{
    name: "Service Mesh",
    id: 126,
    description: "A service mesh is a configurable, low‑latency infrastructure layer
      designed to handle a high volume of network‑based interprocess communication
      among application infrastructure services using application programming
      interfaces (APIs).",
    parent_id: nil
  },
  %Topic{
    name: "Data Protocols & MarketPlaces",
    id: 130,
    description: "Data Protocols and MarketPlaces in the Crypto Ecosystem.",
    parent_id: nil
  },
  %Topic{
    name: "General Crypto Platforms, Frameworks, API's, Products",
    id: 131,
    description: "Platforms, Frameworks, and API's offered by the Crypto Ecosystem.",
    parent_id: nil
  },
  %Topic{
    id: 149,
    name: "Mixed Reality",
    description: "Assets focusing on enabling, or being used within, virtual reality or augmented
reality platforms.",
    parent_id: nil
  },
  %Topic{
    id: 132,
    name: "Distributed & Decentralized Systems Engineering",
    description: "Emerging best practices, products, open source tooling for building next-gen
    internet systems and institutions.",
    parent_id: nil
  },
  %Topic{
    id: 147,
    name: "Edge Computing",
    description: "Edge computing is a distributed computing paradigm which brings
    computation and data storage closer to the location where it is needed, to
    improve response times and save bandwidth. On the Edge, device and sensor endpoints are where most of the
    computation takes place, whereas in Fog computing, the bulk of computation takes place in LAN proxies/gateways nearby the
     edge devices for which the computation is being performed.",
    parent_id: 132
  },
  %Topic{
    id: 148,
    name: "Fog Computing",
    description: "Edge computing is a distributed computing paradigm which brings
computation and data storage closer to the location where it is needed, to
improve response times and save bandwidth.",
    parent_id: 132
  }
]

root_topics
|> Enum.map(&Repo.insert!(&1))

#
# Enum.map(root_topics, fn topic ->
#   changeset = Topic.changeset(%Topic{}, topic)
#   Repo.insert(changeset)
# end)
