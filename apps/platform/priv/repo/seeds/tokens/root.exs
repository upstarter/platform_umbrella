alias Platform.Repo
alias Platform.Tokens.Token

root_tokens = [
  %Token{
    name: "DFINITY",
    symbol: "DFN",
    site: "https://dfinity.org",
    description: "DFINITY, a global internet computer that aims to reinvent the internet as a
        computer that runs secure software with superpowers, is developing the ICP protocol (Internet Computer Protocol) that makes
        it possible for independent data centers to combine the capacity of millions of
        standardized computers to add native, universal, secure and seamless serverless
        cloud functionality to the Internet - in much the same way TCP/IP protocols
        combine private networks to provide the public Internet connectivity we rely on
        today. Adding cloud functionality
        to the Internet using a secure crypto-based protocol provides a tamperproof
        environment where hackproof and unstoppable software can be created. The
        objective of the DFINITY project is to enable the Internet to natively host the
        world's next generation of software systems, mass market Internet services, and
        data"
  },
  %Token{
    name: "OCEAN",
    symbol: "OCN",
    site: "https://oceanprotocol.com",
    description:
      "OCEAN iA Decentralized Data Exchange Protocol to Unlock Data for AI
Ocean Protocol is kickstarting a Data Economy by breaking down data silos and equalizing access to data for all."
  },
  %Token{
    name: "COSMOS",
    symbol: "ATOM",
    site: "https://cosmos.network",
    description:
      "COSMOS is building customizable, interoperable ecosystem of connected blockchains."
  },
  %Token{
    name: "POLKADOT",
    symbol: "DOT",
    site: "https://polkadot.network",
    description:
      "POLKADOT is empowering blockchain networks to work together under the protection of shared security. A united network of state machines,
      the platform enables autonomous economies to develop within fairer peer-to-peer digital jurisdictions."
  },
  %Token{
    name: "TEZOS (XTZ)",
    symbol: "XTZ",
    site: "https://tezos.com",
    description:
      "TEZOS is an open-source platform for assets and applications backed by a global community of validators, researchers, and builders."
  },
  %Token{
    name: "0x",
    symbol: "ZRX",
    site: "https://0x.org",
    description: "0x is an open protocol that enables the peer-to-peer exchange of assets on the
Ethereum blockchain. Anyone in the world can use 0x to service a wide variety of
markets ranging from gaming items to financial instruments to assets that could
have never existed before."
  },
  %Token{
    name: "Bitcoin",
    symbol: "BTC",
    site: "https://www.bitcoincash.org",
    description:
      "Bitcoin is a cryptocurrency, a form of electronic cash. It is a decentralized digital currency without a central bank or single administrator."
  },
  %Token{
    name: "Bitcoin Cash",
    symbol: "BCH",
    site: "",
    description:
      "In mid-2017, a group of developers wanting to increase bitcoin's block size limit prepared a code change. The change, called a hard fork, took effect on 1 August 2017."
  },
  %Token{
    name: "EOSIO",
    symbol: "EOS",
    site: "https://eos.io",
    description:
      "EOSIO (EOS), is built for public or private blockchain networks, customizable to suit your business needs."
  },
  %Token{
    name: "ETHEREUM",
    symbol: "ETH",
    site: "https://www.ethereum.org",
    description:
      "Ethereum is a global, open-source platform for decentralized applications. On Ethereum, you can write code that controls digital value, runs exactly as programmed, and is accessible anywhere in the world."
  },
  %Token{
    name: "Storj",
    symbol: "SJCX",
    site: "https://storj.io",
    description:
      "Storj Labs is the provider of the Storj decentralized cloud storage network, and the company behind STORJ token, a cryptocurrency on the Ethereum blockchain that powers digital storage and data retrieval on its cloud storage platform."
  },
  %Token{
    name: "GOLEM",
    symbol: "GNT",
    site: "https://golem.network",
    description:
      "GOLEM is the provider of peer-to-peer computing power analogous to cloud compute platforms such as EC2 and GCE."
  },
  %Token{
    name: "FILECOIN",
    symbol: "FIL",
    site: "https://filecoin.io",
    description:
      "Filecoin (⨎) is an open-source, public, cryptocurrency and digital payment system intended to be a blockchain-based cooperative digital storage and data retrieval method. "
  },
  %Token{
    name: "ARAGON",
    symbol: "ANT",
    site: "https://aragon.one",
    description:
      "Aragon is an open-source software project that allows for the creation and management of decentralized organizations."
  },
  %Token{
    name: "BLOXROUTE",
    symbol: "BLXR",
    site: "https://bloxroute.com",
    description:
      "BLOXROUTE (BLXR) is a Blockchain Distribution Network (BDN), a first-of-its-kind security token that distributes revenues associated with the cryptocurrencies using bloXroute's Blockchain Distribution Network (BDN) to the wider blockchain community. We believe that the BLXR token gives the project a business model which aligns incentives for a broad base of network participants."
  },
  %Token{
    name: "Interplanetary File System",
    symbol: "IPFS",
    site: "https://bloxroute.com",
    description:
      "BLOXROUTE (BLXR) is a Blockchain Distribution Network (BDN), a first-of-its-kind security token that distributes revenues associated with the cryptocurrencies using bloXroute's Blockchain Distribution Network (BDN) to the wider blockchain community. We believe that the BLXR token gives the project a business model which aligns incentives for a broad base of network participants."
  }
]

root_tokens
|> Enum.map(&Repo.insert!(&1))
