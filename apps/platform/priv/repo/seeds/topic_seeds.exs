# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Platform.Repo.insert!(%Platform.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
topics = [
  %Topic{
    name: "Advertising",
    short_desc: "Decentralized advertising platforms incentivize new markets through
ad-network-specific onchain tokens."
  },
  %Topic{
    name: "Alternative Medicine",
    short_desc: "Assets focusing on alternative medicine, including assets and coins targeted at
the cannabis industry."
  },
  %Topic{
    name: "Application Development",
    short_desc: "Application development platforms use onchain tokens to incentivize development
of blockchain-based ecosystems(platforms) and tools."
  },
  %Topic{
    name: "Artificial Intelligence",
    short_desc: "Assets focusing on AI, using blockchain-based incentives."
  },
  %Topic{
    name: "Asset Management",
    short_desc: "Asset management platforms offer ways to manage onchain assets."
  },
  %Topic{
    name: "Content Creation",
    short_desc: "Content creation chains incentivize content-creation by fostering a
micropayment market between content-consumers and publishers."
  },
  %Topic{
    name: "Crowdfunding Platform",
    short_desc: "Crowdfunding platforms raise money via a native blockchain token
and allocate to projects, often through community vote (either onchain or
through a Foundation)."
  },
  %Topic{
    name: "Crypto Collectible",
    short_desc: "Crypto Collectibles are non-fungible tokens designed to be unique and
tradable."
  },
  %Topic{
    name: "Currency",
    short_desc: "Decentralized currencies operate as money and stores of value. They are
globally accessible and controlled by no single entity or group."
  },
  %Topic{
    name: "dApp Network",
    short_desc: "Decentralized Application (dApp) networks provide access to many
dApps, often layering their own unique services on top."
  },
  %Topic{
    name: "Decentralized Exchange Platform",
    short_desc: "Decentralized exchange platforms allow the conversion of one cryptoasset to
another without a middleman mediating the transaction."
  },
  %Topic{
    name: "Derivatives (Options & Futures)",
    short_desc: "Options & Futures contracts allow one to buy or sell a given amount of
securities based on future events."
  },
  %Topic{
    name: "Developer Tools",
    short_desc: "Projects within this category are primarily used by developers as the building
blocks for decentralized applications."
  },
  %Topic{
    name: "Distributed Computation",
    short_desc: "Distributed computation assets create a market for CPU/GPU power distributed
globally across participating computers."
  },
  %Topic{
    name: "Distributed Storage",
    short_desc: "Distributed storage assets create a market for storage space
distributed globally across participating computers."
  },
  %Topic{
    name: "Energy Market",
    short_desc: "Energy market cryptoassets enable more efficient trading and allocation of
energy-grid resources without reliance on a traditional middleman."
  },
  %Topic{
    name: "Exchange Platform",
    short_desc: "Not to be confused with decentralized exchange platforms this sector refers to
tokens that exist primarily on centralized exchanges for use on those
exchanges."
  },
  %Topic{
    name: "Exchange Traded Funds (ETF's)",
    short_desc: "An ETF is a basket of
securities that you can buy or sell through a brokerage firm on an exchange"
  },
  %Topic{
    name: "Gambling Industry",
    short_desc: "Gaming/Gambling industry assets often use properties of blockchains to achieve
 provably-fair gambling; a property unique to blockchain-based gaming
 platforms."
  },
  %Topic{
    name: "Gaming (non-gambling)",
    short_desc: "Assets focusing on enabling, or being used within, gaming platforms."
  },
  %Topic{
    name: "General Purpose Platform",
    short_desc: "General purpose decentralized compute platforms operate as a global computer,
 capable of executing arbitrary code - called smart contracts or 'dapps'."
  },
  %Topic{
    name: "Hedge Funds",
    short_desc: "A hedge fund is an actively managed basket of securities which are permitted
 to short sell securites and construct advanced models & systems including using
 derivatives(options, etc..) to manage risk and return."
  },
  %Topic{
    name: "Identity",
    short_desc: "Decentralized identity systems use blockchain networks to create identity
records that aren't controlled by any single entity or group."
  },
  %Topic{
    name: "Internet of Things",
    short_desc: "Internet-of-Things assets incentivize participation in IOT networks."
  },
  %Topic{
    name: "Interoperability",
    short_desc: "Interoperability-focused blockchains provide services that can link one chain
to another. These are often intended as core chains or platforms on which wider
ecosystems of more use-case-specific chains can operate together."
  },
  %Topic{
    name: "Lending Platform",
    short_desc: "Blockchain lending platforms generally
collaterize loans using on-blockchain assets, but may offer other loans or
lending functions using blockchain networks."
  },
  %Topic{
    name: "Memes",
    short_desc: "Meme tokens. an element of a culture or system of behavior that may be
considered to be passed from one individual to another by nongenetic means,
especially imitation."
  },
  %Topic{
    name: "Misc",
    short_desc: "Very specific-focus assets which likely do not fit into a broader category."
  },
  %Topic{
    name: "Onchain Governance",
    short_desc: "Onchain Governance assets incorporate the ability for various stakeholders to
directly signal or vote for certain outcomes with respect to development of the
protocol/asset itself."
  },
  %Topic{
    name: "Payment Platform",
    short_desc: "Payment platforms are focused on payments, often for a specific use or
industry. Some blockchain-based payment platforms attempt to integrate multiple
blockchain assets into one platform for ease of payment, possibly employing
smart-contracts for more complex applications."
  },
  %Topic{
    name: "Possible Scams",
    short_desc: "These assets show signs of being scams, and are either currently under
investigation, or are 'near scams' where no explicit intent to decieve is known
to OCFX, yet there's sufficient obvious misleading/improper conduct present to warrant this
classification."
  },
  %Topic{
    name: "Prediction Markets",
    short_desc: "Decentralized prediction markets use onchain-assets to create economic
incentives to correctly predict the outcome of events."
  },
  %Topic{
    name: "Privacy",
    short_desc: "Privacy-focused decentralized currencies incorporate technology designed to
make it difficult or impossible for 3rd parties to track the flow of coins from
one transactor to the next."
  },
  %Topic{
    name: "Scams",
    short_desc: "Scam chains are released with intentionally misleading or false
information. Coins we list under this category must have well-documented
histories showing intent to deceive, and/or exhibit extraordinary claims with
consistent inability to produce evidence justifying such claims. Other coins &
blockchain assets may also be scams. This list is not exhaustive."
  },
  %Topic{
    name: "Timestamping Services",
    short_desc: "Timestamping services underpin decentralized digital-rights management by using
the permanence and irrefutability of blockchains to prove that a piece of
content existed at a certain time."
  },
  %Topic{
    name: "Virtual & Augmented Reality",
    short_desc: "Assets focusing on enabling, or being used within, virtual reality or augmented
reality platforms."
  }
]
