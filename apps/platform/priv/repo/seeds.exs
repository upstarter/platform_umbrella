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
root = '../..'

Code.eval_file("priv/seeds/root_topic_seeds.exs")

File.cd!(root, fn ->
  System.cmd("mix", ["run", "priv/repo/seeds/root_topic_seeds.exs"])
  System.cmd("mix", ["run", "priv/repo/seeds/macroecon_topic_seeds.exs"])
  System.cmd("mix", ["run", "priv/repo/seeds/microecon_topic_seeds.exs"])
  System.cmd("mix", ["run", "priv/repo/seeds/ra_topic_seeds.exs"])
  System.cmd("mix", ["run", "priv/repo/seeds/sector_topic_seeds.exs"])
  System.cmd("mix", ["run", "priv/repo/seeds/general_topic_seeds.exs"])
end)
