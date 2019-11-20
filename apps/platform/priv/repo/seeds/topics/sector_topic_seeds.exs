alias Platform.Repo
alias Platform.Topics.Topic

# "SECTORS" OF THE CRYPTO-ECONOMY

sector_topics = [
  %Topic{
    id: 22,
    name: "Advertising",
    description: "Decentralized advertising platforms incentivize new markets through
ad-network-specific onchain tokens.",
    parent_id: 6
  },
  %Topic{
    id: 23,
    name: "Alternative Medicine",
    description: "Assets focusing on alternative medicine, including assets and coins targeted at
the cannabis industry.",
    parent_id: 6
  },
  %Topic{
    id: 24,
    name: "Blockchain Application Development",
    description: "Application development platforms use onchain tokens to incentivize development
of blockchain-based ecosystems(platforms) and tools.",
    parent_id: 6
  },
  %Topic{
    id: 25,
    name: "Artificial Intelligence Sector",
    description: "Assets focusing on AI, using blockchain-based incentives.",
    parent_id: 6
  },
  %Topic{
    id: 26,
    name: "Asset Management",
    description: "Asset management platforms offer ways to manage onchain assets.",
    parent_id: 6
  },
  %Topic{
    id: 27,
    name: "Content Creation",
    description: "Content creation chains incentivize content-creation by fostering a
micropayment market between content-consumers and publishers.",
    parent_id: 6
  },
  %Topic{
    id: 28,
    name: "Crowdfunding Platforms",
    description: "Crowdfunding platforms raise money via a native blockchain token
and allocate to projects, often through community vote (either onchain or
through a Foundation).",
    parent_id: 6
  },
  %Topic{
    id: 29,
    name: "Crypto Collectibles",
    description: "Crypto Collectibles are non-fungible tokens designed to be unique and
tradable.",
    parent_id: 6
  },
  %Topic{
    id: 30,
    name: "Currencies",
    description: "Decentralized currencies operate as money and stores of value. They are
globally accessible and controlled by no single entity or group.",
    parent_id: 6
  },
  %Topic{
    id: 31,
    name: "dApp Networks",
    description: "Decentralized Application (dApp) networks provide access to many
      dApps with unique services on top.",
    parent_id: 6
  },
  %Topic{
    id: 32,
    name: "Decentralized Exchanges",
    description: "Decentralized exchange platforms allow the conversion of one cryptoasset to
another without a middleman mediating the transaction. They do not require a third
  party to store your funds, thus reducing intermediary risk signicantly",
    parent_id: 6
  },
  %Topic{
    id: 33,
    name: "Derivatives (Options & Futures)",
    description: "Options & Futures contracts allow one to buy or sell a given amount of
securities based on future events.",
    parent_id: 6
  },
  %Topic{
    id: 34,
    name: "Developer Tools",
    description: "Projects within this category are primarily used by developers as the building
blocks for decentralized applications.",
    parent_id: 6
  },
  %Topic{
    id: 35,
    name: "Distributed Computation Markets",
    description: "Distributed computation assets create a market for CPU/GPU power distributed
globally across participating computers.",
    parent_id: 6
  },
  %Topic{
    id: 36,
    name: "Distributed Storage Markets",
    description: "Distributed storage assets create a market for storage space
distributed globally across participating computers.",
    parent_id: 6
  },
  %Topic{
    id: 37,
    name: "Energy Markets",
    description: "Energy market cryptoassets enable more efficient trading and
    allocation of energy-grid resources without reliance on a traditional
    middleman.",
    parent_id: 6
  },
  %Topic{
    id: 38,
    name: "Exchange Platforms",
    description: "Not to be confused with decentralized exchange platforms this
    sector refers to tokens that exist primarily on centralized exchanges for
    use on those exchanges.",
    parent_id: 6
  },
  %Topic{
    id: 39,
    name: "Exchange Traded Funds (ETF's)",
    description: "An ETF is a basket of securities that you can buy or sell
    through a brokerage firm on an exchange",
    parent_id: 6
  },
  %Topic{
    id: 40,
    name: "Gambling Industry",
    description: "Gaming/Gambling industry assets often use properties of
    blockchains to achieve provably-fair gambling; a property unique to
    blockchain-based gaming platforms.",
    parent_id: 6
  },
  %Topic{
    id: 41,
    name: "Gaming (non-gambling)",
    description: "Assets focusing on enabling, or being used within, gaming platforms.",
    parent_id: 6
  },
  %Topic{
    id: 42,
    name: "General Purpose Platform",
    description: "General purpose decentralized compute platforms operate as a
    global computer, capable of executing arbitrary code - called smart
    contracts or 'dapps'.",
    parent_id: 6
  },
  %Topic{
    id: 43,
    name: "Hedge Funds",
    description: "A hedge fund is an actively managed basket of securities which
    are permitted to short sell securites and construct advanced models &
    systems including using derivatives(options, etc..) to manage risk and
    return.",
    parent_id: 6
  },
  %Topic{
    id: 44,
    name: "Identity & Reputation",
    description:
      "Decentralized identity and reputation systems use blockchain
    networks to create identity records that aren't controlled by any single entity or group with reputation mechanisms for quality assurance.",
    parent_id: 6
  },
  %Topic{
    id: 45,
    name: "Internet of Things Sector",
    description: "Internet-of-Things assets incentivize participation in IOT networks.",
    parent_id: 6
  },
  %Topic{
    id: 46,
    name: "Interoperability",
    description: "Interoperability-focused blockchains provide services that can link one chain
to another. These are often intended as core chains or platforms on which wider
ecosystems of more use-case-specific chains can operate together.",
    parent_id: 6
  },
  %Topic{
    id: 47,
    name: "Lending Platforms",
    description: "Blockchain lending platforms generally
collaterize loans using on-blockchain assets, but may offer other loans or
lending functions using blockchain networks.",
    parent_id: 6
  },
  %Topic{
    id: 48,
    name: "Memes",
    description: "Meme tokens. an element of a culture or system of behavior that may be
considered to be passed from one individual to another by nongenetic means,
especially imitation.",
    parent_id: 6
  },
  %Topic{
    id: 49,
    name: "Misc",
    description: "Very specific-focus assets which likely do not fit into a broader category.",
    parent_id: 6
  },
  %Topic{
    id: 50,
    name: "Onchain Governance",
    description: "Onchain Governance assets incorporate the ability for various stakeholders to
directly signal or vote for certain outcomes with respect to development of the
protocol/asset itself.",
    parent_id: 6
  },
  %Topic{
    id: 51,
    name: "Payment Platforms",
    description: "Payment platforms are focused on payments, often for a specific use or
industry. Some blockchain-based payment platforms attempt to integrate multiple
blockchain assets into one platform for ease of payment, possibly employing
smart-contracts for more complex applications.",
    parent_id: 6
  },
  %Topic{
    id: 52,
    name: "Possible Scams",
    description: "These assets show signs of being scams, and are either currently under
investigation, or are 'near scams' where no explicit intent to decieve is known
to OCFX, yet there's sufficient obvious misleading/improper conduct present to warrant this
classification.",
    parent_id: 6
  },
  %Topic{
    id: 53,
    name: "Prediction Markets",
    description: "Decentralized prediction markets use onchain-assets to create economic
incentives to correctly predict the outcome of events.",
    parent_id: 6
  },
  %Topic{
    id: 54,
    name: "Privacy",
    description: "Privacy-focused decentralized currencies incorporate technology designed to
make it difficult or impossible for 3rd parties to track the flow of coins from
one transactor to the next.",
    parent_id: 6
  },
  %Topic{
    id: 55,
    name: "Scams",
    description: "Scam chains are released with intentionally misleading or false
information. Coins we list under this category must have well-documented
histories showing intent to deceive, and/or exhibit extraordinary claims with
consistent inability to produce evidence justifying such claims. Other coins &
blockchain assets may also be scams. This list is not exhaustive.",
    parent_id: 6
  },
  %Topic{
    id: 56,
    name: "Timestamping Services",
    description: "Timestamping services underpin decentralized digital-rights management by using
the permanence and irrefutability of blockchains to prove that a piece of
content existed at a certain time.",
    parent_id: 6
  },
  %Topic{
    id: 57,
    name: "Mixed, Virtual & Augmented Reality",
    description: "Assets focusing on enabling, or being used within, virtual reality or augmented
reality platforms.",
    parent_id: 6
  }
]

sector_topics
|> Enum.map(&Repo.insert!(&1))
