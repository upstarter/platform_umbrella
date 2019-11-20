alias Platform.Repo
alias Platform.Users.Profiles.Role

roles = [
  %Role{
    title: "curator"
  },
  %Role{
    title: "strategist"
  },
  %Role{
    title: "analyst"
  },
  %Role{
    title: "engineer"
  },
  %Role{
    title: "tpm"
  }
]

roles
|> Enum.map(&Repo.insert!(&1))
