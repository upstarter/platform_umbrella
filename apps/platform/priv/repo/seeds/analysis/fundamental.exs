alias Platform.Repo
alias Platform.Topics.Topic
# 2: ra, 90: fundamental, 21: valuation frameworks
fund = [
  %Topic{
    id: 114,
    name: "Discounted Cash Flow (DCF)",
    description: "",
    path: [2, 17, 90, 21]
  },
  %Topic{
    id: 115,
    name: "Net Present Value (NPV)",
    description: "",
    path: [2, 17, 90, 21]
  },
  %Topic{
    id: 116,
    name: "Equation of Exchange",
    description: "",
    path: [2, 17, 90, 21]
  }
]

fund
|> Enum.map(&Repo.insert!(&1))
