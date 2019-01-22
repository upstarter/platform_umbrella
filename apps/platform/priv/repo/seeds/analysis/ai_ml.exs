alias Platform.Repo
alias Platform.Topics.Topic

ai = [
  %Topic{
    id: 113,
    name: "Neural Networks",
    description: "",
    path: [2, 91, 106]
  }
]

ai
|> Enum.map(&Repo.insert!(&1))
