alias Platform.Repo
alias Platform.Topics.Topic

# TAXONOMY OF CRYPTOASSETS 2018
roots = [
  %Topic{
    name: "Fungible Tokens",
    id: 79,
    description:
      "Tokens which are perfectly interchangeable with other identical tokens. Do not need a central counterparty to confirm their authenticity.",
    parent_id: 20
  },
  %Topic{
    name: "Utility Tokens",
    id: 80,
    description:
      "Tokens whose intended purpose is to provide access to an infrastructure or service via the blockchain.",
    parent_id: 79
  },
  %Topic{
    name: "Payment Tokens",
    id: 81,
    description: "Tokens whose intended use is to provide a means of payment or value exchange.",
    parent_id: 79
  },
  %Topic{
    name: "Asset-security Tokens",
    id: 82,
    description: "Umbrella term used to describe tokens which either confer a financial claim on
an issuer or an asset which grants explicit governance rights to a token holder.",
    parent_id: 79
  }
]

utility_topics = [
  %Topic{
    name: "Platform Tokens",
    id: 83,
    description: "These are tokens that are used to gain access to
      general purpose decentralized networks for a wide range of possible
      applications. As such, these platform utility tokens exhibit considerably
      less centrality. Work Tokens include REP, MKR, KEEP, CIVIC, 0X, BAT, GOLEM, LPT, NUMERAIRE, ETH, EOS.
      Usage Tokens include BTC, BTCash, LTC, NEM, IOTA, MNR, ETH, BAT, KIN, RNDR.",
    parent_id: 80
  },
  %Topic{
    name: "Non-Platform Tokens",
    id: 84,
    description: "These tokens are open networks designed for a specific application or use
      case. Decentralized exchange tokens are an example. Represents the
      majority of current assets in the ecosystem.",
    parent_id: 80
  },
  %Topic{
    name: "General Network Tokens",
    id: 85,
    description: "Open Networks designed for a specific application or use case.",
    parent_id: 84
  },
  %Topic{
    name: "Defined Non-Platform Tokens",
    id: 86,
    description: "Defined Non-platform based utility tokens are similar to a
    consumer token as the intended use is to provide access to a particular
    (defined) set of goods or a service. The tokens here are used on the network
    of a single project. However, they can become more “general” over time.",
    parent_id: 84
  }
]

asset_security_topics = [
  %Topic{
    name: "Collateralized Tokens",
    id: 87,
    description: "Tokens that are collateralized by fiat (e.g. TrueUSD collateralized by USD)
or non-fiat assets (e.g. Digix collateralized by gold).",
    parent_id: 82
  },
  %Topic{
    name: "Tokenized Securities",
    id: 88,
    description: "Allow bonds, stocks, equities and commodities to be traded as digital tokens.
Traditional legal frameworks and pricing methodologies exist for these assets.",
    parent_id: 82
  },
  %Topic{
    name: "Share-like Tokens",
    id: 89,
    description: "Tokens that offer the rights to specific cash-flows (e.g. from centralized
exchanges).",
    parent_id: 82
  }
]

fungible_topics = roots ++ utility_topics ++ asset_security_topics

fungible_topics
|> Enum.map(&Repo.insert!(&1))
