defmodule Platform.Tokens.Asset do
  @moduledoc """

    correspondent with Platform.Token schema

  """

  defstruct [:id, :ticker, :name, :img, :site, :short_desc]
  alias Platform.Tokens.Asset

  def random_string(length) do
    :crypto.strong_rand_bytes(length) |> Base.url_encode64() |> binary_part(0, length)
  end

  def cw_assets do
    # multichain capital
    # money-like functional utility tokens:
    # 1. profit-share (burn-and-mint) equilibrium mechanic
    # 2. work tokens (not payments, right to perform work in network)
    #   • augur, keep
    %{
      governance: ["Aragon", "Colony", "Tezos"],
      utility_tokens: [
        work_tokens: ["civic", "0x", "Basic attention token", "golem"],
        usage_tokens: []
      ],
      ai: ["botc", "OCN (ocean protocol)", "singularityNet"],
      securitized_computing_resources: ["Filecoin", "Sia", "Storj", "Golem", "Orchid"],
      reputation_mining: ["Rootcore", "Colony", "Numeraire", "Zeppelin", "OSCoin"],
      advertising: ["Adchain"],
      curation_markets: [],
      bonding_curves: []
    }
  end

  def portfolio do
    [
      %Asset{
        id: random_string(64),
        ticker: "ETH",
        name: "Etherum",
        site: "ethereum.org",
        short_desc: "Ethereum is a decentralized platform for applications that run
          exactly as programmed without any chance of fraud, censorship or
          third-party interference."
      },
      %Asset{
        id: random_string(64),
        ticker: "REP",
        name: "Augur",
        img: "https://icowatchlist.com/logos/augur.png",
        site: "augur.net",
        short_desc: "A prediction market protocol owned and operated by the people that use it."
      },
      %Asset{
        id: random_string(64),
        ticker: "STEEM",
        name: "Steemit",
        site: "steemit.com",
        short_desc: "Steemit has redefined social media by building a living, breathing,
          and growing social economy - a community where users are rewarded for
          sharing their voice. It's a new kind of attention economy."
      },
      %Asset{
        id: random_string(64),
        ticker: "BTC",
        name: "Bitcoin",
        site: "bitcoin.org",
        short_desc: "Bitcoin is an innovative payment network and a new kind of money."
      },
      %Asset{
        id: random_string(64),
        ticker: "GNT",
        name: "Golem Network",
        img: "https://icowatchlist.com/logos/golem.png",
        site: "golem.network",
        short_desc: "Golem is the first truly decentralized, global market for computing power."
      },
      %Asset{
        id: random_string(64),
        ticker: "SJCX",
        name: "Storj",
        img: "https://icowatchlist.com/logos/storj.png",
        site: "storj.io",
        short_desc: "Storj (pronounced: storage) aims to become a cloud storage platform
          that can’t be censored or monitored, or have downtime. It is the first
          decentralized, end-to-end encrypted cloud storage that uses blockchain
          technology and cryptography to secure your files."
      },
      %Asset{
        id: random_string(64),
        ticker: "SC",
        name: "Sia",
        site: "sia.tech",
        short_desc: "Sia is a decentralized storage platform secured by blockchain technology."
      },
      %Asset{
        id: random_string(64),
        ticker: "XMR",
        name: "Monero",
        site: "getmonero.org",
        short_desc: "A digital currency that is secure, private, and untraceable"
      },
      %Asset{
        id: random_string(64),
        ticker: "DGD",
        name: "DigixDAO",
        img: "https://icowatchlist.com/logos/digixdao.png",
        site: "digix.global",
        short_desc: "We create a world where the finest gold bars are made divisible and
          transferable on the blockchain."
      },
      %Asset{
        id: random_string(64),
        ticker: "AMP",
        name: "Synereo",
        site: "synereo.com",
        short_desc: "Synereo offers blockchain-enabled Attention Economy solutions,
          allowing direct and platform agnostic monetization of original content
          posted anywhere on the net."
      },
      %Asset{
        id: random_string(64),
        ticker: "FCT",
        name: "Factom",
        site: "factom.com",
        short_desc: "We create products that transform the way organizations secure and
          share their data. Our products safeguard the most critical government,
          commercial, and non-profit systems."
      },
      %Asset{
        id: random_string(64),
        ticker: "ICN",
        name: "ICONOMI",
        img: "https://icowatchlist.com/logos/iconomi.png",
        site: "iconomi.net",
        short_desc: "DIGITAL ASSET MANAGEMENT PLATFORM"
      },
      %Asset{
        id: random_string(64),
        ticker: "PLU",
        name: "Pluton",
        site: "plutus.it",
        short_desc:
          "Decentralized Loyalty Rewards System: Earn rewards for spending your crypto tokens"
      },
      %Asset{
        id: random_string(64),
        ticker: "SNGLS",
        name: "SingularDTV",
        site: "singulardtv.com",
        short_desc: "A Blockchain Entertainment Studio Empowering artists with
          applications to manage and create projects from development to
          distribution."
      },
      %Asset{
        id: random_string(64),
        ticker: "LBC",
        name: "LBRY",
        site: "lbry.io",
        short_desc: "A content sharing and publishing platform that is decentralized and
          owned by its users."
      },
      %Asset{
        id: random_string(64),
        ticker: "NXT",
        name: "Nxt",
        site: "nxtplatform.org",
        short_desc: "Nxt is a platform that allows you to create your applications
          directly on its blockchain."
      },
      %Asset{
        id: random_string(64),
        ticker: "BTS",
        name: "Bitshares",
        site: "bitshares.org",
        short_desc: "A stack of financial services including exchange and banking on a
        blockchain."
      },
      %Asset{
        id: random_string(64),
        ticker: "NMC",
        name: "Namecoin",
        site: "namecoin.org",
        short_desc: "An experimental open-source technology which improves
          decentralization, security, censorship resistance, privacy, and speed
          of certain components of the Internet infrastructure such as DNS and
          identities."
      }
    ]
  end

  def base_protocols do
    [
      %Asset{
        ticker: "EOS",
        img: "https://icowatchlist.com/logos/eos.png",
        short_desc: "A powerful infrastructure for decentralized apps"
      },
      %Asset{ticker: "ADA"},
      %Asset{ticker: "ZRX"},
      %Asset{ticker: "LSK"},
      %Asset{ticker: "TRX"},
      %Asset{ticker: "ICN"},
      %Asset{ticker: "IOTA"},
      %Asset{ticker: "DFINITY"}
    ]
  end

  def ai_icos do
    [
      %Asset{
        ticker: "BOTC",
        name: "BotChain",
        site: "https://botchain.talla.com/",
        short_desc:
          "Infrastructure for Trust and Audit of AI Systems. It helps with increased adoption of AI",
        img: "https://icowatchlist.com/logos/botchain.png"
      },
      %Asset{
        ticker: "CND",
        name: "Cindicator",
        site: "https://cindicator.com/",
        short_desc: "Hybrid Intelligence for effective asset management",
        img: ""
      }
    ]
  end

  # gif
  # https://gph.is/2vHfpvK
  def financial_icos do
    [
      %Asset{ticker: "SAN", name: "Santiment"},
      %Asset{ticker: "WIZ", name: "CrowdWiz"},
      %Asset{ticker: "SKRP", name: "Skraps"},
      %Asset{ticker: "SGN", name: "Signals"},
      %Asset{ticker: "KRL", name: "Kryll"},
      %Asset{ticker: "AUC", name: "Auctus"},
      %Asset{
        ticker: "ACO",
        name: "Acorn Collective",
        img: "https://icowatchlist.com/logos/acorn-collective.png"
      },
      %Asset{
        ticker: "GRET+GREM",
        name: "Global REIT",
        img: "https://icowatchlist.com/logos/global-reit.png"
      },
      %Asset{ticker: nil, name: "Trilliant"}
    ]
  end

  def the_token_io_portfolio do
    "QTM"
    "STRATIS"
    "WAVES"
    "AELF"
    "REQUEST NETWORK"
    "ICON"
    "TOKEN BOX"
  end

  def curiosities do
    "FOAM (Proof of Location)"
  end
end
