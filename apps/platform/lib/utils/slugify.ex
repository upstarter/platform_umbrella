# import Ecto.Changeset
#
# defimpl Slugify, for: Topic do
#   def slugify(topic) do
#     slug = Slugger.slugify(topic.name)
#
#     topic
#     |> change(%{slug: slug})
#   end
# end
