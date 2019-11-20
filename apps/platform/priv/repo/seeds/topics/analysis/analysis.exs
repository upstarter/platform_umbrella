alias Platform.Repo
alias Platform.Topics.Topic
# Knowledge leads to wisdom. Wisdom is enlightenment. Wisdom over money.
# cyptocurrencies are a hedge against potentially deflationary fiat currencies.
analysis_topics = [
  %Topic{
    id: 90,
    name: "Fundamental Analysis",
    description:
      "The valuation of a business based on intrinsic factors like current financial metrics,
    quality of management, and economic forecasting. Extrinsic factors like the macro-economic environment are also taken into account.",
    parent_id: 17
  },
  %Topic{
    id: 91,
    name: "Technical Analysis",
    description:
      "The valuation of a financial asset based on statistical measures and algorithms.",
    parent_id: 17
  },
  %Topic{
    id: 92,
    name: "Hybrid Analysis (Tech/Fundamental)",
    description:
      "A combination of technical and fundamental analysis, usually in some interesting combination.",
    parent_id: 17
  },
  %Topic{
    id: 93,
    name: "Trend Following",
    description:
      "An investment approach in which the central tendency of the movement in a financial asset is the principal factor.",
    parent_id: 91
  },
  %Topic{
    id: 94,
    name: "Price Driven TA",
    description:
      "Technical Analysis where the price (and possibly its' first and second derivatives) is the focus of decision making activities.",
    parent_id: 91
  },
  # https://www.quantshare.com/sa-446-different-types-of-trading-indicators-trend-momentum-volatility-and-volume
  %Topic{
    id: 95,
    name: "Indicator & Oscillator Driven TA",
    description:
      "Technical Analysis where the focus is on (generally first-order) functions of price and its' corralaries.",
    parent_id: 91
  },
  %Topic{
    id: 96,
    name: "Volatility Based Indicators",
    description: "Indicators derived from the magnitude of deviations in price",
    parent_id: 91
  },
  %Topic{
    id: 97,
    name: "Momentum Based Indicators",
    description: "Indicators derived from the rate of change in price.",
    parent_id: 91
  },
  %Topic{
    id: 98,
    name: "Trend Based Indicators",
    description: "Indicators dervied from the general direction or trajectory of price.",
    parent_id: 91
  },
  %Topic{
    id: 99,
    name: "Volume Based Indicators",
    description:
      "Indicators based on and derived from the number of transactions over some period.",
    parent_id: 91
  },
  %Topic{
    id: 100,
    name: "Moving Averages",
    description: "The central tendency in price over some period of time.",
    parent_id: 91
  },
  %Topic{
    id: 101,
    name: "Digital Signal Processing (DSP)",
    description:
      "The decomposition of various financial asset time series into their component waveforms and analysed accordingly.",
    parent_id: 91
  },
  %Topic{
    id: 102,
    name: "Sentiment",
    description: "The psychological and sociological world in which market participants operate.",
    parent_id: 91
  },
  %Topic{
    id: 103,
    name: "Elliot Wave",
    description: "A theory based on collective impulses and their corresponding market patterns.",
    parent_id: 91
  },
  %Topic{
    id: 104,
    name: "Charting",
    description: "The visual representations of financial data.",
    parent_id: 91
  },
  %Topic{
    id: 105,
    name: "Breadth",
    description:
      "A measurement of aggregate conditions in markets the ratio of increasing to decreasing products is analysed.",
    parent_id: 91
  },
  %Topic{
    id: 106,
    name: "AI & Machine Learning (Technical Analysis)",
    description: "The analysis of markets using models and algorithms based on brain functions.",
    parent_id: 91
  },
  %Topic{
    id: 107,
    name: "Backtesting",
    description:
      "Evaluating assets over specific time periods by running tests, including injection of anomalies for tuning models.",
    parent_id: 91
  },
  %Topic{
    id: 119,
    name: "Risk Management",
    description:
      "The prudent use of rationality in ones decision making processes in relation to finances. Careful evaluation of the risk/reward of a particular offering.",
    parent_id: 2
  },
  %Topic{
    id: 120,
    name: "Analytical Software Tools",
    description:
      "The models, programs, frameworks, and products used to optimize a program of trading or investing.",
    parent_id: 2
  },
  %Topic{
    id: 122,
    name: "Swing Trading",
    description:
      "Taking market positions over short to medium term periods (usually a few days to a few weeks).",
    parent_id: 91
  }
]

analysis_topics
|> Enum.map(&Repo.insert!(&1))
