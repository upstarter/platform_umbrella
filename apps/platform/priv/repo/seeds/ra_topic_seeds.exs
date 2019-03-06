alias Platform.Repo
alias Platform.Topics.Topic

ra_topics = [
  %Topic{
    id: 15,
    name: "Factor Investing",
    description: "Factor investing is a strategy that chooses securities on
      attributes that are associated with higher returns. There are two main
      types of factors that have driven returns of stocks, bonds, and other
      factors; macroeconomic factors and style factors.",
    parent_id: 17
  },
  %Topic{
    id: 16,
    name: "Portfolio Optimization",
    description: "The process of selecting the best portfolio (asset
      distribution), out of the set of all portfolios being considered, according
      to some objective.",
    parent_id: 17
  },
  %Topic{
    id: 17,
    name: "Strategy & Systems",
    description: "A set of rules, behaviors or procedures, designed to guide an
      investor's selection of an investment portfolio or trading system.",
    parent_id: 2
  },
  %Topic{
    id: 18,
    name: "Global Tactical Asset Allocation",
    description: "A top-down investment strategy that attempts to exploit
      short-term mis-pricings among a global set of assets. The strategy focuses
      on general movements in the market rather than on performance of individual securities.",
    parent_id: 17
  },
  %Topic{
    id: 19,
    name: "Trading Systems & Methods",
    description: "A computer program that creates orders and automatically
      submits them to a market center or exchange. The program will automatically
      generate orders based on predefined set of rules using a trading strategy
      which is often based on technical analysis but can also be based on input
      from other electronic sources.",
    parent_id: 17
  },
  %Topic{
    id: 20,
    name: "Crypto Asset Taxonomy",
    description: "Classification of cryptoassets into narrowly defined subsets
      for the purpose of analysis. For example, equity-like offerings, or
      fixed-income, derivatives, commodity-linked assets, currencies etc..",
    parent_id: 2
  },
  %Topic{
    id: 21,
    name: "Valuation Frameworks",
    description: "Emerging and Existing token valuation frameworks.",
    parent_id: 90
  }
]

ra_topics
|> Enum.map(&Repo.insert!(&1))
