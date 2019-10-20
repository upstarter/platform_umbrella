# File.exists?("~/.nix/config/lang/elixir/.iex.exs") && import_file("~/.nix/config/lang/elixir/.iex.exs")
#
import Ecto.Query
alias Platform.Repo
alias Platform.Marketing.Lead
alias Platform.Topics.Topic
alias Platform.Auth.Credential
alias Platform.Users.User
alias Platform.Accounts.Account
alias Platform.Tokens.Token
alias Platform.Users.Proposal

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
