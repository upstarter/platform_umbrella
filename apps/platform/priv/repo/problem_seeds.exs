alias Platform.Repo
alias Platform.Proposals.Proposal

root_proposals = [
  %Proposal{
    type: "internal",
    title: "",
    description: "",
    active: true,
    is_public: true,
    status: "published",
    user_id: "",
    cached_votes_for_total: ""
  },
  %Proposal{
    type: "internal",
    title: "",
    description: "",
    active: true,
    is_public: true,
    status: "published",
    user_id: "",
    cached_votes_for_total: ""
  },
  %Proposal{
    type: "internal",
    title: "",
    description: "",
    active: true,
    is_public: true,
    status: "published",
    user_id: "",
    cached_votes_for_total: ""
  },
  %Proposal{
    type: "internal",
    title: "",
    description: "",
    active: true,
    is_public: true,
    status: "published",
    user_id: "",
    cached_votes_for_total: ""
  },
  %Proposal{
    type: "internal",
    title: "",
    description: "",
    active: true,
    is_public: true,
    status: "published",
    user_id: "",
    cached_votes_for_total: ""
  },
  %Proposal{
    type: "internal",
    title: "",
    description: "",
    active: true,
    is_public: true,
    status: "published",
    user_id: "",
    cached_votes_for_total: ""
  }
]

root_proposals
|> Enum.map(&Repo.insert!(&1))
