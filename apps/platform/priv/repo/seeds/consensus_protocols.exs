alias Platform.Repo
alias Platform.Topics.Topic

cp_topics = [
  %Topic{
    id: 133,
    name: "Proof of Work",
    description: "BTC, ETH, LTC, DOGE",
    parent_id: 9
  },
  %Topic{
    id: 134,
    name: "Proof of Stake",
    description: "Decred, ETH, Peercoin",
    parent_id: 9
  },
  %Topic{
    id: 135,
    name: "Delegated Proof of Stake (DPoS)",
    description: "Steemit, EOS, Bitshares",
    parent_id: 9
  },
  %Topic{
    id: 136,
    name: "Proof of Authority",
    description: "POA.Network, Ethereum Kovan testnet, Vechain",
    parent_id: 9
  },
  %Topic{
    id: 137,
    name: "Proof of Weight (PoWeight)",
    description: "Algorand, Filecoin, Chia",
    parent_id: 9
  },
  %Topic{
    id: 138,
    name: "Byzantine Fault Tolerance (BFT)",
    description: "Sacrifices Decentralization for cheaper and faster transactions.
    Centralized and closed membership. 1 recomended validator list chosen
    by authority. Hyperledger, Stellar, Dispatch, Ripple",
    parent_id: 9
  },
  %Topic{
    id: 139,
    name: "Practical Byzantine Fault Tolerance (PBFT)",
    description: "Decentralized alternative to BFT. Hyperledger Fabric",
    parent_id: 9
  },
  %Topic{
    id: 140,
    name: "Federated Byzantine Agreement (FBA)",
    description: "No recommended validator, each validator chooses validators they
    trust. Open membership network. Quorum slices allow for open membership decentralization.
    Network allows growing decentralization. Stellar, Ripple",
    parent_id: 9
  },
  %Topic{
    id: 141,
    name: "Directed Acyclic Graph (DAG)",
    description: "Iota, Hashgraph, Raiblocks/Nano",
    parent_id: 9
  },
  %Topic{
    id: 142,
    name: "Hybrid Proof of Work/Stake",
    description:
      "PoW/PoS algorithms allow PoW minting to take place before switching to PoS, ETH (with Casper)",
    parent_id: 9
  },
  %Topic{
    id: 143,
    name: "Proof of Coordination",
    description: "Covee",
    parent_id: 9
  }
]

cp_topics
|> Enum.map(&Repo.insert!(&1))
