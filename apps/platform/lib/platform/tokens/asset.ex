defmodule Platform.Asset do
  # correspondent with Platform.Token schema
  defstruct [:ticker, :name, :img, :site, :desc]
  alias Platform.Asset

  def coinfund_assets do
    [
      %Asset{ticker: "ETH",
             name: "Etherum",
             site: "ethereum.org",
             desc: "Ethereum is a decentralized platform for applications that run exactly as programmed without any chance of fraud, censorship or third-party interference."},

      %Asset{ticker: "REP",
             name: "Augur",
             img: "https://icowatchlist.com/logos/augur.png",
             site: "augur.net",
             desc: "A prediction market protocol owned and operated by the people that use it."},

      %Asset{ticker: "STEEM",
             name: "Steemit",
             site: "steemit.com",
             desc: "Steemit has redefined social media by building a living, breathing, and growing social economy - a community where users are rewarded for sharing their voice. It's a new kind of attention economy."},

      %Asset{ticker: "BTC",
             name: "Bitcoin",
             site: "bitcoin.org",
             desc: "Bitcoin is an innovative payment network and a new kind of money."},

      %Asset{ticker: "GNT",
             name: "Golem Network",
             img: "https://icowatchlist.com/logos/golem.png",
             site: "golem.network",
             desc: "Golem is the first truly decentralized, global market for computing power."},

      %Asset{ticker: "SJCX",
             name: "Storj",
             img: "https://icowatchlist.com/logos/storj.png",
             site: "storj.io",
             desc: "Storj (pronounced: storage) aims to become a cloud storage platform that can’t be censored or monitored, or have downtime. It is the first decentralized, end-to-end encrypted cloud storage that uses blockchain technology and cryptography to secure your files."},

      %Asset{ticker: "SC",
             name: "Sia",
             site: "sia.tech",
             desc: "Sia is a decentralized storage platform secured by blockchain technology."},

      %Asset{ticker: "XMR",
             name: "Monero",
             site: "getmonero.org",
             desc: "A digital currency that is secure, private, and untraceable"},

      %Asset{ticker: "DGD",
             name: "DigixDAO",
             img: "https://icowatchlist.com/logos/digixdao.png",
             site: "digix.global",
             desc: "We create a world where the finest gold bars are made divisible and transferable on the blockchain."},

      %Asset{ticker: "AMP",
             name: "Synereo",
             site: "synereo.com",
             desc: "Synereo offers blockchain-enabled Attention Economy solutions, allowing direct and platform agnostic monetization of original content posted anywhere on the net."},

      %Asset{ticker: "FCT",
             name: "Factom",
             site: "factom.com",
             desc: "We create products that transform the way organizations secure and share their data. Our products safeguard the most critical government, commercial, and non-profit systems."},

      %Asset{ticker: "ICN",
             name: "ICONOMI",
             img: "https://icowatchlist.com/logos/iconomi.png",
             site: "iconomi.net",
             desc: "DIGITAL ASSET MANAGEMENT PLATFORM"},

      %Asset{ticker: "PLU",
             name: "Pluton",
             site: "plutus.it",
             desc: "Decentralized Loyalty Rewards System: Earn rewards for spending your crypto tokens"},

      %Asset{ticker: "SNGLS",
             name: "SingularDTV",
             site: "singulardtv.com",
             desc: "A Blockchain Entertainment Studio Empowering artists with applications to manage and create projects from development to distribution."},

      %Asset{ticker: "LBC",
             name: "LBRY",
             site: "lbry.io",
             desc: "A content sharing and publishing platform that is decentralized and owned by its users."},

      %Asset{ticker: "NXT",
             name: "Nxt",
             site: "nxtplatform.org",
             desc: "Nxt is a platform that allows you to create your applications directly on its blockchain."},

      %Asset{ticker: "BTS",
             name: "Bitshares",
             site: "bitshares.org",
             desc: "A stack of financial services including exchange and banking on a blockchain."},

      %Asset{ticker: "NMC",
             name: "Namecoin",
             site: "namecoin.org",
             desc: "An experimental open-source technology which improves decentralization, security, censorship resistance, privacy, and speed of certain components of the Internet infrastructure such as DNS and identities."},
    ]
  end

  def base_protocols do
    [
      %Asset{ticker: "EOS",
             img: "https://icowatchlist.com/logos/eos.png",
             desc: "A powerful infrastructure for decentralized apps"},
      %Asset{ticker: "IOTA"},
      %Asset{ticker: "ADA"},
      %Asset{ticker: "LSK"},
      %Asset{ticker: "TRX"},
      %Asset{ticker: "ICN"},
      %Asset{ticker: "ZRX"}
    ]
  end


  def ai_icos do
    [
      %Asset{ticker: "BOTC",
             name: "BotChain",
             site: "https://botchain.talla.com/",
             desc: "Infrastructure for Trust and Audit of AI Systems It helps with increased adoption of AI",
             img: "https://icowatchlist.com/logos/botchain.png"}
    ]
  end

  # gif
  # https://gph.is/2vHfpvK
  def financial_icos do
    [
      %Asset{ticker: "SAN",
             name: "Santiment"},
      %Asset{ticker: "WIZ",
             name: "CrowdWiz"},
      %Asset{ticker: "SKRP",
             name: "Skraps"},
      %Asset{ticker: "SGN",
             name: "Signals"},
      %Asset{ticker: "KRL",
             name: "Kryll"},
      %Asset{ticker: "AUC",
             name: "Auctus"},
      %Asset{ticker: "ACO",
             name: "Acorn Collective",
             img: "https://icowatchlist.com/logos/acorn-collective.png"},
      %Asset{ticker: "GRET+GREM",
             name: "Global REIT",
             img: "https://icowatchlist.com/logos/global-reit.png"},
      %Asset{ticker: nil, name: "Trilliant"}
    ]
  end


end
