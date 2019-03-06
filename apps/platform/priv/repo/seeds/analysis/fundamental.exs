alias Platform.Repo
alias Platform.Topics.Topic
# 2: ra, 90: fundamental, 21: valuation frameworks
fund = [
  %Topic{
    id: 114,
    name: "Discounted Cash Flow (DCF)",
    description: "",
    parent_id: 21
  },
  %Topic{
    id: 115,
    name: "Net Present Value (NPV)",
    description: "",
    parent_id: 21
  },
  %Topic{
    id: 116,
    name: "Equation of Exchange",
    description: "",
    parent_id: 21
  }
]

fund
|> Enum.map(&Repo.insert!(&1))
