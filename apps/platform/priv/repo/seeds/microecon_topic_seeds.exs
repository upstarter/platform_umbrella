alias Platform.Repo
alias Platform.Topics.Topic

cryptoecon_topics = [
  # parent
  %Topic{
    name: "Micro Economy",
    id: 7,
    description: "The 'Firm' or 'Entity' level analysis of crypto projects. Includes
    strategic policies, protocols, crypto-economic primitives, governance models,
    token/incentive engineering, token distribution models.",
    path: [1]
  },
  # children of microecon
  %Topic{
    id: 8,
    name: "Mechanism Design",
    description: "A field in economics and game theory that takes an engineering
      approach to designing economic mechanisms or incentives, toward
      desired objectives, in strategic settings, where players act
      rationally.",
    path: [1, 7]
  },
  %Topic{
    id: 9,
    name: "Consensus Protocols",
    description: "A consensus algorithm is a process in computer science used to achieve
      agreement on a single data value among distributed processes or systems.
      Consensus algorithms are designed to achieve reliability in a network involving
      multiple unreliable nodes.",
    path: [1, 7]
  },
  %Topic{
    id: 10,
    name: "Crypto Economic Primitives",
    description: "Protocol based incentives systems that are uniquely enabled by tokens. Also
      referred to as “tokenized economic games”. They enable the coordination and
      allocation of capital to achieve a shared goal via the use of various economic
      and cryptographic mechanisms. Examples include curation markets, token curated registries,
      token bonding curves, etc..",
    path: [1, 7]
  },
  %Topic{
    name: "Governance Models",
    id: 11,
    description: "The concerted efforts by which cooperation and decision-making can be achieved,
      collectively, and action can be taken accordingly when necessary to ensure the
      integrity of the ecosystem. Because governance and social consensus takes time,
      is an emergent property, and creating a sound ecosystem that can interoperate
      well to perceive that emergent consensus & signaling is paramount.",
    path: [1, 7]
  },
  %Topic{
    id: 12,
    name: "Smart Contracts",
    description: "Technology enabled legal agreements.",
    path: [1, 7]
  },
  %Topic{
    id: 13,
    name: "Token Engineering",
    description: "Primitive building blocks and current best practices for designing and
      implementing crypto networks.",
    path: [1, 7]
  },
  %Topic{
    id: 14,
    name: "Open Network Business Models",
    description: "Existing & Emerging business models enabled by crypto networks.",
    path: [1, 7]
  },
  %Topic{
    id: 112,
    name: "Token Distribution Models",
    description: "Existing & Emerging distribution models enabled by crypto networks.",
    path: [1, 7]
  }
]

cryptoecon_topics
|> Enum.map(&Repo.insert!(&1))
