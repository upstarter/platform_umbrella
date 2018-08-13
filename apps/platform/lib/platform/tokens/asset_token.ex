defmodule Platform.AssetToken do
  defstruct [:ticker, :name, :img, :site, :desc]
  alias Platform.Token

  def coinfund_assets do
    [
      %Token{ticker: "ETH",
             name: "Etherum",
             site: "ethereum.org",
             desc: "Ethereum is a decentralized platform for applications that run exactly as programmed without any chance of fraud, censorship or third-party interference."},

      %Token{ticker: "REP",
             name: "Augur",
             img: "https://icowatchlist.com/logos/augur.png",
             site: "augur.net",
             desc: "A prediction market protocol owned and operated by the people that use it."},

      %Token{ticker: "STEEM",
             name: "Steemit",
             site: "steemit.com",
             desc: "Steemit has redefined social media by building a living, breathing, and growing social economy - a community where users are rewarded for sharing their voice. It's a new kind of attention economy."},

      %Token{ticker: "BTC",
             name: "Bitcoin",
             site: "bitcoin.org",
             desc: "Bitcoin is an innovative payment network and a new kind of money."},

      %Token{ticker: "GNT",
             name: "Golem Network",
             img: "https://icowatchlist.com/logos/golem.png",
             site: "golem.network",
             desc: "Golem is the first truly decentralized, global market for computing power."},

      %Token{ticker: "SJCX",
             name: "Storj",
             img: "https://icowatchlist.com/logos/storj.png",
             site: "storj.io",
             desc: "Storj (pronounced: storage) aims to become a cloud storage platform that can’t be censored or monitored, or have downtime. It is the first decentralized, end-to-end encrypted cloud storage that uses blockchain technology and cryptography to secure your files."},

      %Token{ticker: "SC",
             name: "Sia",
             site: "sia.tech",
             desc: "Sia is a decentralized storage platform secured by blockchain technology."},

      %Token{ticker: "XMR",
             name: "Monero",
             site: "getmonero.org",
             desc: "A digital currency that is secure, private, and untraceable"},

      %Token{ticker: "DGD",
             name: "DigixDAO",
             img: "https://icowatchlist.com/logos/digixdao.png",
             site: "digix.global",
             desc: "We create a world where the finest gold bars are made divisible and transferable on the blockchain."},

      %Token{ticker: "AMP",
             name: "Synereo",
             site: "synereo.com",
             desc: "Synereo offers blockchain-enabled Attention Economy solutions, allowing direct and platform agnostic monetization of original content posted anywhere on the net."},

      %Token{ticker: "FCT",
             name: "Factom",
             site: "factom.com",
             desc: "We create products that transform the way organizations secure and share their data. Our products safeguard the most critical government, commercial, and non-profit systems."},

      %Token{ticker: "ICN",
             name: "ICONOMI",
             img: "https://icowatchlist.com/logos/iconomi.png",
             site: "iconomi.net",
             desc: "DIGITAL ASSET MANAGEMENT PLATFORM"},

      %Token{ticker: "PLU",
             name: "Pluton",
             site: "plutus.it",
             desc: "Decentralized Loyalty Rewards System: Earn rewards for spending your crypto tokens"},

      %Token{ticker: "SNGLS",
             name: "SingularDTV",
             site: "singulardtv.com",
             desc: "A Blockchain Entertainment Studio Empowering artists with applications to manage and create projects from development to distribution."},

      %Token{ticker: "LBC",
             name: "LBRY",
             site: "lbry.io",
             desc: "A content sharing and publishing platform that is decentralized and owned by its users."},

      %Token{ticker: "NXT",
             name: "Nxt",
             site: "nxtplatform.org",
             desc: "Nxt is a platform that allows you to create your applications directly on its blockchain."},

      %Token{ticker: "BTS",
             name: "Bitshares",
             site: "bitshares.org",
             desc: "A stack of financial services including exchange and banking on a blockchain."},

      %Token{ticker: "NMC",
             name: "Namecoin",
             site: "namecoin.org",
             desc: "An experimental open-source technology which improves decentralization, security, censorship resistance, privacy, and speed of certain components of the Internet infrastructure such as DNS and identities."},
    ]
  end

  def base_protocols do
    [
      %Token{ticker: "EOS",
             img: "https://icowatchlist.com/logos/eos.png",
             desc: "A powerful infrastructure for decentralized apps"},
      %Token{ticker: "IOTA"},
      %Token{ticker: "ADA"},
      %Token{ticker: "LSK"},
      %Token{ticker: "TRX"},
      %Token{ticker: "ICN"},
      %Token{ticker: "ZRX"}
    ]
  end


  def icos do

  end

  def financial_icos do
    [
      %Token{ticker: "SAN",
             name: "Santiment"},
      %Token{ticker: "WIZ",
             name: "CrowdWiz"},
      %Token{ticker: "SKRP",
             name: "Skraps"},
      %Token{ticker: "SGN",
             name: "Signals"},
      %Token{ticker: "KRL",
             name: "Kryll"},
      %Token{ticker: "AUC",
             name: "Auctus"},
      %Token{ticker: "ACO",
             name: "Acorn Collective",
             img: "https://icowatchlist.com/logos/acorn-collective.png"},
      %Token{ticker: "GRET+GREM",
             name: "Global REIT",
             img: "https://icowatchlist.com/logos/global-reit.png"},
      %Token{ticker: "BOTC",
             name: "BotChain",
             site: "https://botchain.talla.com/",
             desc: "Infrastructure for Trust and Audit of AI Systems It helps with increased adoption of AI",
             img: "https://icowatchlist.com/logos/botchain.png"},
      %Token{ticker: nil, name: "Trilliant"}
    ]
  end


end
