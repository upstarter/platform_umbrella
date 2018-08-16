# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Platform.Repo.insert!(%Platform.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

topics = %{
"Cryptoeconomics" => {
  short_desc: "Cryptoeconomics refers to the combinations of cryptography, computer networks and game theory which provide secure systems exhibiting some set of economic dis/incentives.",
  long_desc:  "",
},

"Decentralized Apps (Dapps)" => {
  short_desc: "A decentralized application (Dapp, dApp or DApp) is an application that is run by many users on a decentralized network with trustless protocols. They are designed to avoid any single point of failure. They typically have tokens to reward users for providing computing power.",
  long_desc:  "",
},

"Cryptocurrencies" => {
  short_desc: "A digital currency in which encryption techniques are used to regulate the generation of units of currency and verify the transfer of funds, operating independently of a central bank.",
  long_desc:  "",
},

"Regulatory" => {
  short_desc: "A rule or directive made and maintained by an authority.",
  long_desc:  "",
},

"Compliance" => {
  short_desc: "The act or process of complying to a desire, demand, proposal, or regimen or to coercion",
  long_desc:  "",
},

"CryptoCloud" => {
  short_desc: "Crypto cloud computing is a secure cloud computing architecture. Cloud computing is a large-scale distributed computing model that is driven by economies of scale. It integrates a set of abstracted, virtualized, dynamically-scalable, and managed resources, such as computing power, storage, platforms, and services.",
  long_desc:  "",
},

"Sustainability" => {
  short_desc: "Sustainable development is development that meets the needs of the present without compromising the ability of future generations to meet their own needs.",
  long_desc:  "",
},

"Network Ownership Effects" => {
  short_desc: "A network ownership effect describes when the utility of the service and the value of ownership of the service increases for existing users when new users join.",
  long_desc:  "",
},

"Social Impact" => {
  short_desc: "A significant, positive change that addresses a pressing social challenge.",
  long_desc:  "",
},

"ERC-XX" => {
  short_desc: "ERC stands for Ethereum Request for Comments, like the IETF's RFC (https://www.ietf.org/rfc.html). An RFC is authored by engineers and computer scientists in the form of a memorandum describing methods, behaviors, research, or innovations applicable to the working of the Internet and Internet-connected systems. It is submitted either for peer review or to convey new concepts, information, or (occasionally) engineering humor",
  long_desc:  "",
},

"Crypto Investment Strategy" => {
  short_desc: "",
  long_desc:  "",
},

"Global Tactical Asset Allocation" => {
  short_desc: "",
  long_desc:  "",
},

"Trading Systems & Methods" => {
  short_desc: "",
  long_desc:  "",
},

"Decentralized Exchanges" => {
  short_desc: "",
  long_desc:  "",
},

"Portfolio Optimization" => {
  short_desc: "",
  long_desc:  "",
},

"Game Theory" => {
  short_desc: "",
  long_desc:  "",
},

"Mechanism Design" => {
  short_desc: "",
  long_desc:  "",
},

"Artificial Intelligence" => {
  short_desc: "",
  long_desc:  "",
},

"Robotics" => {
  short_desc: "",
  long_desc:  "",
},

"Internet of Things" => {
  short_desc: "",
  long_desc:  "",
},

}

Platform.Repo.insert!(%Platform.Topic{

  })
