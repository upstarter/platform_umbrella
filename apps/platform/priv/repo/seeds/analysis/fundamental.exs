alias Platform.Repo
alias Platform.Topics.Topic
# 2: ra, 90: fundamental, 21: valuation frameworks
fund = [
  %Topic{
    id: 114,
    name: "Discounted Cash Flow (DCF)",
    description: "A method of financial asset valuation which discounts future cash flows.",
    parent_id: 21
  },
  %Topic{
    id: 115,
    name: "Net Present Value (NPV)",
    description:
      "A method of financial asset valuation which determines the present value taking into account future earnings.",
    parent_id: 21
  },
  %Topic{
    id: 116,
    name: "Equation of Exchange",
    description: "A method of financial asset valuation which is based on the velocity of money.",
    parent_id: 21
  }
]

fund
|> Enum.map(&Repo.insert!(&1))
