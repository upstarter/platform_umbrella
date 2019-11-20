alias Platform.Repo
alias Platform.Topics.Topic

[
  "discount tokens",
  "native profit sharing tokens",
  "work tokens",
  "burn and mint tokens",
  "governance tokens"
]

general_topics = [
  %Topic{
    id: 58,
    name: "Decentralized Apps (Dapps)",
    description: "A decentralized application (Dapp, dApp or DApp) is an application that
      is run by many users on a decentralized network with trustless protocols.
      They are designed to avoid any single point of failure. They typically
      have tokens to reward users for providing computing power.",
    parent_id: 7
  },
  %Topic{
    id: 59,
    name: "Cryptocurrencies",
    description: "A digital currency in which encryption techniques are used
      to regulate the generation of units of currency and verify the transfer
      of funds, operating independently of a central bank.",
    parent_id: 5
  },
  %Topic{
    id: 60,
    name: "Crypto Regulation",
    description: "A rule or directive made and maintained by an authority.",
    parent_id: 5
  },
  %Topic{
    id: 61,
    name: "Crypto Compliance",
    description: "The act or process of complying to a desire, demand, proposal, or regimen or to
  coercion.",
    parent_id: 7
  },
  %Topic{
    id: 62,
    name: "CryptoCloud",
    description: "Crypto cloud computing is a secure cloud computing architecture. Cloud
      computing is a large-scale distributed computing model that is driven by
      economies of scale. It integrates a set of abstracted, virtualized,
      dynamically-scalable, and managed resources, such as computing power, storage,
      platforms, and services.",
    parent_id: 123
  },
  %Topic{
    id: 63,
    name: "Sustainability",
    description: "Sustainable development is development that meets the needs of the
      present without compromising the ability of future generations to meet
      their own needs.",
    parent_id: 5
  },
  %Topic{
    id: 64,
    name: "Security",
    description:
      "How, where, when, and why to store your cryptoassets, and how to protect yourself
      from hackers.",
    parent_id: 7
  },
  %Topic{
    id: 65,
    name: "Network Ownership Effects",
    description: "A network ownership effect describes when the utility of the service and
      the value of ownership of the service increases for existing users when
      new users join.",
    parent_id: 7
  },
  %Topic{
    id: 66,
    name: "Social Impact",
    description: "A significant, positive change that addresses a pressing social challenge.",
    parent_id: 5
  },
  %Topic{
    id: 67,
    name: "ERC-XXX (Ethereum Request for Comments)",
    description: "ERC stands for Ethereum Request for Comments, like the IETF's RFC
    (https://www.ietf.org/rfc.html). An RFC is authored by engineers and computer
    scientists in the form of a memorandum describing methods, behaviors, research,
    or innovations applicable to the working of the Internet and Internet-connected
    systems. It is submitted either for peer review or to convey new concepts,
    information, or (occasionally) engineering humor",
    parent_id: 7
  },
  %Topic{
    id: 68,
    name: "DeFi (Decentralized Finance)",
    description: "Decentralized finance is driving a more open economy.
      One in which the people in a democracy can take control of their financial system
      by building and using the tools to take control of their assets out of the hands of rent seeking
      intermediaries and into their own, so they can make better decisions about them. It keeps
      risk at the edge and not at the center of the financial system.",
    parent_id: nil
  },
  %Topic{
    id: 69,
    name: "Game Theory",
    description: "Simply put, game theory is the study of logical decision making made
      by players within the defined parameters of a system (game, scenario,
      etc). It uses mathematical models and can be applied to economics,
      psychology, logic, computer science, distributed systems, and more.
      Game theory can be seen as a microcosm of human behavior under set
      circumstances wherein certain incentive structures and mechanisms can
      lead to predictable and honest behavior by players.",
    parent_id: 5
  },
  %Topic{
    id: 70,
    name: "Robotics",
    description: "An interdisciplinary branch of engineering and science that includes
      mechanical engineering, electronics engineering, computer science, and
      others.",
    parent_id: 7
  },
  %Topic{
    id: 71,
    name: "Internet of Things",
    description: "The network of physical devices, vehicles, home appliances, and other items
      embedded with electronics, software, sensors, actuators, and connectivity which
      enables these things to connect and exchange data, creating opportunities for
      more direct integration of the physical world into computer-based systems,
      resulting in efficiency improvements, economic benefits, and reduced human
      exertions.",
    parent_id: 7
  }
]

general_topics
|> Enum.map(&Repo.insert!(&1))
