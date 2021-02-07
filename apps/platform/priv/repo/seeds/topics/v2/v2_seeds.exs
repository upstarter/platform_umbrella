alias Platform.Repo
alias Platform.Topics.Topic
# current available id is 180
v2_topics = [
  %Topic{
    name: "Trend Following",
    id: 150,
    description: "As the adage goes, \"The trend is your friend\".
        A trading approach where direction of movement of a financial asset is
        the 1st and principal factor in trading decisions.",
    parent_id: 129
  },
  %Topic{
    name: "Momentum Trading",
    id: 151,
    description:
      "Those assets showing greatest velocity and acceleration in change offer immense reward.",
    parent_id: 129
  },
  %Topic{
    name: "Volatility Trading",
    id: 152,
    description: "High volatility brings high rewards. How to capture delta and find the
    assets with the most potential movement in the near term.",
    parent_id: 129
  },
  %Topic{
    name: "Day Trading",
    id: 153,
    description: "Finding cyclicality and recurring patterns for short term returns in 1-2 days.",
    parent_id: 129
  },
  %Topic{
    name: "Swing Trading",
    id: 154,
    description:
      "Finding cyclicality and recurring patterns for the medium term returns. 1-2 weeks",
    parent_id: 129
  },
  %Topic{
    name: "Earnings Trading",
    id: 155,
    description: "Using volatility around earnings to capture market value.",
    parent_id: 129
  },
  %Topic{
    name: "Event Trading",
    id: 156,
    description:
      "Using volatility around important economic, geo-political, and other events to capture market value.",
    parent_id: 129
  },
  # Risk Management
  %Topic{
    name: "Monte Carlo Simulation",
    id: 157,
    description:
      "Using statistical probabilities to simulate trading outcomes and find optimal control and prediction
      of important risk factors.",
    parent_id: 119
  },
  %Topic{
    name: "Types of Risk",
    id: 158,
    description: "Types of risk in financial risk management.",
    parent_id: 119
  },
  %Topic{
    name: "Market Risk",
    id: 159,
    description:
      "Credit risk management is a profession that focuses on reducing and preventing losses by understanding and measuring the probability of those losses.",
    parent_id: 158
  },
  %Topic{
    name: "Equity Risk",
    id: 160,
    description:
      "the risk that stock prices in general (not related to a particular company or industry) or the implied volatility will change",
    parent_id: 158
  },
  %Topic{
    name: "Interest Rate Risk",
    id: 161,
    description:
      "Interest rate risk is the risk that interest rates or the implied volatility will change. The change in market rates and their impact on the probability of a bank, lead to interest rate risk.",
    parent_id: 158
  },
  %Topic{
    name: "Currency Risk",
    id: 162,
    description:
      "Currency risk is the risk that foreign exchange rates or the implied volatility will change, which affects, for example, the value of an asset held in that currency",
    parent_id: 158
  },
  %Topic{
    name: "Commodity Risk",
    id: 163,
    description:
      "Commodity risk is the risk that commodity prices (e.g. corn, copper, crude oil) or implied volatility will change.",
    parent_id: 158
  },
  %Topic{
    name: "Foreign Exchange Risk",
    id: 164,
    description:
      "A foreign exchange hedge (also called a FOREX hedge) is a method used by companies to eliminate or \"hedge\" their foreign exchange risk resulting from transactions in foreign currencies (see foreign exchange derivative). This is done using either the cash flow hedge or the fair value method.",
    parent_id: 158
  },
  %Topic{
    name: "Model Risk",
    id: 165,
    description:
      "Financial risk measurement, pricing of financial instruments, and portfolio selection are all based on statistical models. If the model is wrong, risk numbers, prices, or optimal portfolios are wrong. Model risk quantifies the consequences of using the wrong models in risk measurement, pricing, or portfolio selection.",
    parent_id: 158
  },
  %Topic{
    name: "Shape Risk",
    id: 166,
    description:
      "Shape risk in finance is a type of basis risk when hedging a load profile with standard hedging products having a lower granularity.",
    parent_id: 158
  },
  %Topic{
    name: "Volatility Risk",
    id: 167,
    description:
      "Volatility risk is the risk of a change of price of a portfolio as a result of changes in the volatility of a risk factor. It usually applies to portfolios of derivatives instruments, where the volatility of its underlying is a major influencer of prices.",
    parent_id: 158
  },
  %Topic{
    name: "Value at Risk",
    id: 168,
    description:
      "Value at risk (VaR) is a measure of the risk of loss for investments. It estimates how much a set of investments might lose (with a given probability), given normal market conditions, in a set time period such as a day. VaR is typically used by firms and regulators in the financial industry to gauge the amount of assets needed to cover possible losses.",
    parent_id: 158
  },
  %Topic{
    name: "Risk Pools",
    id: 169,
    description:
      "A risk pool is one of the forms of risk management mostly practiced by insurance companies. Under this system, insurance companies come together to form a pool, which can provide protection to insurance companies against catastrophic risks such as floods or earthquakes.",
    parent_id: 158
  },
  %Topic{
    name: "Liquidity Risk",
    id: 170,
    description:
      "This is the risk that a given security or asset cannot be traded quickly enough in the market to prevent a loss (or make the required profit).",
    parent_id: 158
  },
  %Topic{
    name: "Inflation Risk",
    id: 171,
    description:
      "Inflationary risk is the risk that inflation will undermine an investment's returns through a decline in purchasing power. Bond payments are most at inflationary risk because their payouts are generally based on fixed interest rates and an increase in inflation diminishes their purchasing power",
    parent_id: 158
  },
  %Topic{
    name: "Business Risk",
    id: 172,
    description:
      "Business risk is the exposure a company or organization has to factor(s) particular to it that will lower its profits or lead it to fail. Anything that threatens a company's ability to achieve its financial goals is considered a business risk.",
    parent_id: 158
  },
  %Topic{
    name: "Legal Risk",
    id: 173,
    description:
      "Businesses do not operate in a vacuum and that, in the exploitation of opportunities and their engagement with other businesses, their activities tend to become subjects of legal liabilities and obligations",
    parent_id: 158
  },
  %Topic{
    name: "Technological Risk",
    id: 174,
    description:
      "Information technology risk, IT risk, IT-related risk, or cyber risk is any risk related to information technology",
    parent_id: 158
  },
  %Topic{
    name: "Reputational Risk",
    id: 175,
    description:
      "The potential loss to financial capital, social capital and/or market share resulting from damage to a firm's reputation.",
    parent_id: 158
  },
  %Topic{
    name: "Sector Risk",
    id: 176,
    description:
      "Sector risk is the risk that one sector (like health care or technology) will fall in price at the same time because of an event that affects the entire industry.",
    parent_id: 158
  },
  %Topic{
    name: "Operational Risk",
    id: 177,
    description:
      "Operational risk means the risk that a company or individual has to face due their own operation and decisions made for the investment.",
    parent_id: 158
  },
  %Topic{
    name: "Automata",
    id: 178,
    description: "A concurrent multi-agent system for building trading systems on Elixir and OTP",
    parent_id: 120
  },
  %Topic{
    name: "Keras",
    id: 179,
    description: "The high level package for Tensorflow™ that makes deep learning easy in python",
    parent_id: 120
  },
  %Topic{
    name: "ScikitLearn",
    id: 180,
    description: "The package that makes many scientific and ML tasks easy in python",
    parent_id: 120
  },
  %Topic{
    name: "Julia Lang",
    id: 181,
    description: "The high level language for high performance scientific computing",
    parent_id: 120
  },
  %Topic{
    name: "Spark",
    id: 182,
    description: "The system level component that made streaming AI relevant",
    parent_id: 120
  },
  %Topic{
    name: "",
    id: 183,
    description: "The high level package that makes deep learning easy in python",
    parent_id: 120
  },
  %Topic{
    name: "PyTorch",
    id: 184,
    description: "The high level package that makes deep learning easy in python",
    parent_id: 120
  },
  %Topic{
    name: "PyTorch",
    id: 185,
    description: "The high level package that makes deep learning easy in python",
    parent_id: 120
  },
  # AI
  %Topic{
    id: 186,
    name: "Neural Networks",
    description: "Algorithms which mimic human brain activity",
    parent_id: 106
  },
  %Topic{
    id: 187,
    name: "Architecture Search",
    description: "Algorithms which mimic human brain activity",
    parent_id: 106
  },
  %Topic{
    id: 188,
    name: "Reinforcement Learning Systems",
    description: "Algorithms which mimic human brain activity",
    parent_id: 106
  },
  %Topic{
    id: 189,
    name: "Multi-Agent Learning Systems",
    description: "Algorithms which mimic human brain activity",
    parent_id: 106
  },
  %Topic{
    id: 190,
    name: "Evolutionary Computation",
    description: "Algorithms which mimic human brain activity",
    parent_id: 106
  },
  %Topic{
    id: 191,
    name: "Genetic Algorithms",
    description: "Algorithms which mimic the natural selection process",
    parent_id: 190
  },
  %Topic{
    id: 192,
    name: "Genetic Programming",
    description:
      "In artificial intelligence, genetic programming (GP) is a technique of evolving programs, starting from a population of unfit (usually random) programs, fit for a particular task by applying operations analogous to natural genetic processes to the population of programs.",
    parent_id: 190
  },
  %Topic{
    id: 193,
    name: "Monte Carlo Methods",
    description:
      "Algorithms which utilize statistical sampling to improve accuracy, precision, correctness",
    parent_id: 106
  },
  %Topic{
    id: 194,
    name: "Neuroevolution",
    description:
      "Backpropagation-free form of architecture search for evolving generations of feed-forward neural networks",
    parent_id: 106
  }
]

v2_topics
|> Enum.map(&Repo.insert!(&1))
