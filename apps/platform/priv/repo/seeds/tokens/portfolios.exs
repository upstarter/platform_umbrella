alias Platform.Repo
alias Platform.Portfolios.Portfolio

portfolio_tokens = [
  %Portfolio{
    id: 1,
    name: "The WiseMind Portfolio",
    description: "The WiseMind Portfolio. Cryptoassets selected by the wisdom of the crowd."
  }
]

portfolio_tokens
|> Enum.map(&Repo.insert!(&1))
