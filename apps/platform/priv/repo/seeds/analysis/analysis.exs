alias Platform.Repo
alias Platform.Topics.Topic
# Knowledge leads to wisdom. Wisdom is enlightenment. Wisdom over money.
# cyptocurrencies are a hedge against potentially deflationary fiat currencies.
analysis_topics = [
  %Topic{
    id: 90,
    name: "Fundamental Analysis",
    description: "",
    parent_id: 17
  },
  %Topic{
    id: 91,
    name: "Technical Analysis",
    description: "",
    parent_id: 17
  },
  %Topic{
    id: 92,
    name: "Hybrid Analysis",
    description: "",
    parent_id: 17
  },
  %Topic{
    id: 93,
    name: "Trend Following",
    description: "",
    parent_id: 91
  },
  %Topic{
    id: 94,
    name: "Price Driven TA",
    description: "",
    parent_id: 91
  },
  # https://www.quantshare.com/sa-446-different-types-of-trading-indicators-trend-momentum-volatility-and-volume
  %Topic{
    id: 95,
    name: "Indicator & Oscillator Driven TA",
    description: "",
    parent_id: 91
  },
  %Topic{
    id: 96,
    name: "Volatility Based Indicators",
    description: "",
    parent_id: 91
  },
  %Topic{
    id: 97,
    name: "Momentum Based Indicators",
    description: "",
    parent_id: 91
  },
  %Topic{
    id: 98,
    name: "Trend Based Indicators",
    description: "",
    parent_id: 91
  },
  %Topic{
    id: 99,
    name: "Volume Based Indicators",
    description: "",
    parent_id: 91
  },
  %Topic{
    id: 100,
    name: "Moving Averages",
    description: "",
    parent_id: 91
  },
  %Topic{
    id: 101,
    name: "Digital Signal Processing (DSP)",
    description: "",
    parent_id: 91
  },
  %Topic{
    id: 102,
    name: "Sentiment",
    description: "",
    parent_id: 91
  },
  %Topic{
    id: 103,
    name: "Elliot Wave",
    description: "",
    parent_id: 91
  },
  %Topic{
    id: 104,
    name: "Charting",
    description: "",
    parent_id: 91
  },
  %Topic{
    id: 105,
    name: "Breadth",
    description: "",
    parent_id: 91
  },
  %Topic{
    id: 106,
    name: "AI & Machine Learning",
    description: "",
    parent_id: 91
  },
  %Topic{
    id: 107,
    name: "Backtesting",
    description: "",
    parent_id: 91
  },
  %Topic{
    id: 119,
    name: "Risk Management",
    description: "",
    parent_id: 2
  },
  %Topic{
    id: 120,
    name: "Analytical Tools",
    description: "",
    parent_id: 2
  },
  %Topic{
    id: 122,
    name: "Swing Trading",
    description: "",
    parent_id: 91
  }
]

analysis_topics
|> Enum.map(&Repo.insert!(&1))
