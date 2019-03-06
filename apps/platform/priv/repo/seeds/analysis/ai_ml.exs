alias Platform.Repo
alias Platform.Topics.Topic

ai = [
  %Topic{
    id: 113,
    name: "Neural Networks",
    description: "",
    parent_id: 106
  }
]

ai
|> Enum.map(&Repo.insert!(&1))
