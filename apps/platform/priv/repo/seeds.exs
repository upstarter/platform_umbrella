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
root = './'

# Code.eval_file("priv/seeds/root_topic_seeds.exs")

File.cd!(root, fn ->
  # have been run - DO NOT RUN ON PROD
  System.cmd("mix", ["run", "priv/repo/seeds/topics/root_topic_seeds.exs"])
  System.cmd("mix", ["run", "priv/repo/seeds/topics/macroecon_topic_seeds.exs"])
  System.cmd("mix", ["run", "priv/repo/seeds/topics/microecon_topic_seeds.exs"])
  System.cmd("mix", ["run", "priv/repo/seeds/topics/ra_topic_seeds.exs"])
  System.cmd("mix", ["run", "priv/repo/seeds/topics/sector_topic_seeds.exs"])
  System.cmd("mix", ["run", "priv/repo/seeds/topics/general_topic_seeds.exs"])
  System.cmd("mix", ["run", "priv/repo/seeds/topics/analysis/analysis.exs"])
  System.cmd("mix", ["run", "priv/repo/seeds/topics/analysis/fundamental.exs"])
  System.cmd("mix", ["run", "priv/repo/seeds/topics/analysis/ai_ml.exs"])
  System.cmd("mix", ["run", "priv/repo/seeds/topics/taxonomy/fungibles.exs"])
  System.cmd("mix", ["run", "priv/repo/seeds/topics/taxonomy/non_fungibles.exs"])
  System.cmd("mix", ["run", "priv/repo/seeds/topics/consensus_protocols.exs"])
  # need to be run
  System.cmd("mix", ["run", "priv/repo/seeds/tokens/root.exs"])
  System.cmd("mix", ["run", "priv/repo/seeds/tokens/portfolios.exs"])
  System.cmd("mix", ["run", "priv/repo/seeds/role_seeds.exs"])
end)
