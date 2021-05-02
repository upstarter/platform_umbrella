# File.exists?("~/.nix/config/lang/elixir/.iex.exs") && import_file("~/.nix/config/lang/elixir/.iex.exs")
#
import Ecto.Query
alias Platform.Repo
alias Platform.Marketing.Lead
alias Platform.Topics.Topic, as: TO
alias Platform.Auth.Credential, as: CD
alias Platform.Accounts.Account, as: A
alias Platform.Tokens.Token, as: TK
alias Platform.Tokens
alias Platform.Users.User
alias Platform.Users.Proposal
alias Platform.Users.UsersTopics, as: UT
alias Platform.Users.Profiles.UserProfile, as: UP
alias Platform.Portfolios.Portfolio, as: P
alias Platform.Users.Portfolios.PortfolioToken, as: PT
alias Platform.Users.Portfolios.UserPortfolio, as: UPF
alias Platform.Market.DailyMarketHistory, as: MH
alias Platform.ExchangeRates, as: EX
alias Platform.Users.Discussions.Thread
alias Platform.Users.Discussions.Post
alias Platform.Market.TokenCache.CacheToken, as: CT

# alias Platform.Groups.Group

IO.puts("TokenCache:")
IO.puts(CT.list())

IO.puts("Users:")
IO.puts(Enum.count(Repo.all(User)))

IO.puts("DMH's:")
IO.puts(Enum.count(Repo.all(MH)))

IO.puts("Thread's:")
IO.puts(Enum.count(Repo.all(Thread)))

IO.puts("Post's:")
IO.puts(Enum.count(Repo.all(Post)))
# defmodule Fix do
#   def add_topic(name, description, parent) do
#     topic = %Topic{
#       name: name,
#       description: description,
#       parent_id: parent
#     }
#
#     Repo.insert!(topic)
#   end
#
#   def delete_users do
#     u = from(u in User, where: u.id < 20)
#     Repo.delete_all(u)
#   end
#
#   def users do
#     from(u in User, where: u.id < 20)
#   end
# end

IEx.configure(
  colors: [
    syntax_colors: [
      number: :light_yellow,
      atom: :light_cyan,
      string: :white,
      boolean: :red,
      nil: [:magenta, :bright]
    ],
    ls_directory: :cyan,
    ls_device: :yellow,
    doc_code: :green,
    doc_inline_code: :magenta,
    doc_headings: [:cyan, :underline],
    doc_title: [:cyan, :bright, :underline]
  ],
  default_prompt:
    "#{IO.ANSI.green()}%prefix#{IO.ANSI.reset()}" <>
      "[#{IO.ANSI.cyan()}%counter#{IO.ANSI.reset()}]>",
  alive_prompt:
    "#{IO.ANSI.green()}%prefix#{IO.ANSI.reset()}" <>
      "(#{IO.ANSI.yellow()}%node#{IO.ANSI.reset()})" <>
      "[#{IO.ANSI.cyan()}%counter#{IO.ANSI.reset()}]>",
  history_size: 50,
  inspect: [
    pretty: true,
    limit: :infinity,
    width: 80
  ],
  width: 80
)
