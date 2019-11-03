# File.exists?("~/.nix/config/lang/elixir/.iex.exs") && import_file("~/.nix/config/lang/elixir/.iex.exs")
#
import Ecto.Query
alias Platform.Repo
alias Platform.Marketing.Lead
alias Platform.Topics.Topic
alias Platform.Auth.Credential
alias Platform.Accounts.Account
alias Platform.Tokens.Token
alias Platform.Users.User
alias Platform.Users.Proposal
alias Platform.Users.UsersTopics
# alias Platform.Groups.Group
# alias Platform.Market.DailyMarketHistory
# alias Platform.Market.History

IO.puts("Users:")
IO.puts(Enum.count(Repo.all(User)))

defmodule Fix do
  def add_topic(name, description, parent) do
    topic = %Topic{
      name: name,
      description: description,
      parent_id: parent
    }

    Repo.insert!(topic)
  end

  def delete_users do
    u = from(u in User, where: u.id < 20)
    Repo.delete_all(u)
  end

  def users do
    from(u in User, where: u.id < 20)
  end
end

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
