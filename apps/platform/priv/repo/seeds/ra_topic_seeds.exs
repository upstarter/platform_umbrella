ra_topics = [
  %Topic{
    name: "Factor Investing",
    description: "Factor investing is a strategy that chooses securities on
      attributes that are associated with higher returns. There are two main
      types of factors that have driven returns of stocks, bonds, and other
      factors; macroeconomic factors and style factors.",
    path: [2]
  },
  %Topic{
    name: "Portfolio Optimization",
    description: "The process of selecting the best portfolio (asset
      distribution), out of the set of all portfolios being considered, according
      to some objective.",
    path: [2]
  },
  %Topic{
    name: "Crypto Investment Strategy",
    description: "A set of rules, behaviors or procedures, designed to guide an
      investor's selection of an investment portfolio.",
    path: [2]
  },
  %Topic{
    name: "Global Tactical Asset Allocation",
    description: "A top-down investment strategy that attempts to exploit
      short-term mis-pricings among a global set of assets. The strategy focuses
      on general movements in the market rather than on performance of individual securities.",
    path: [2]
  },
  %Topic{
    name: "Trading Systems & Methods",
    description: "A computer program that creates orders and automatically
      submits them to a market center or exchange. The program will automatically
      generate orders based on predefined set of rules using a trading strategy
      which is often based on technical analysis but can also be based on input
      from other electronic sources.",
    path: [2]
  },
  %Topic{
    name: "Cryptoasset Classes",
    description: "Classification of Cryptoassets into coherently defined subsets
      for the purpose of analysis. For example, equity-like offerings, or
      fixed-income, derivatives, commodity-linked assets, etc..",
    path: [2]
  },
  %Topic{
    name: "Valuation Frameworks",
    description: "Emerging and Existing token valuation frameworks evaluated objectively.",
    path: [2]
  }
]

ra_topics
|> Enum.map(&Platform.Repo.insert!(&1))
