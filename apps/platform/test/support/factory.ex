defmodule Platform.Factory do
  use ExMachina.Ecto, repo: Platform.Repo

  def user_factory do
    %Platform.Users.User{
      first_name: "Jane",
      last_name: "Doe",
      email: sequence(:email, &"email-#{&1}@example.com")
      # role: sequence(:role, ["admin", "user", "other"])
    }
  end

  # def article_factory do
  #   title = sequence(:title, &"Use ExMachina! (Part #{&1})")
  #   # derived attribute
  #   slug = Platform.Article.title_to_slug(title)
  #   %Platform.Article{
  #     title: title,
  #     slug: slug,
  #     # associations are inserted when you call `insert`
  #     author: build(:user),
  #   }
  # end
  #
  # # derived factory
  # def featured_article_factory do
  #   struct!(
  #     article_factory(),
  #     %{
  #       featured: true,
  #     }
  #   )
  # end
  #
  # def comment_factory do
  #   %Platform.Comment{
  #     text: "It's great!",
  #     article: build(:article),
  #   }
  # end
end

# Using factories (check out the docs for more details):

# # `attrs` are automatically merged in for all build/insert functions.
#
# # `build*` returns an unsaved comment.
# # Associated records defined on the factory are built.
# attrs = %{body: "A comment!"} # attrs is optional. Also accepts a keyword list.
# build(:comment, attrs)
# build_pair(:comment, attrs)
# build_list(3, :comment, attrs)
#
# # `insert*` returns an inserted comment. Only works with ExMachina.Ecto
# # Associated records defined on the factory are inserted as well.
# insert(:comment, attrs)
# insert_pair(:comment, attrs)
# insert_list(3, :comment, attrs)
#
# # `params_for` returns a plain map without any Ecto specific attributes.
# # This is only available when using `ExMachina.Ecto`.
# params_for(:comment, attrs)
#
# # `params_with_assocs` is the same as `params_for` but inserts all belongs_to
# # associations and sets the foreign keys.
# # This is only available when using `ExMachina.Ecto`.
# params_with_assocs(:comment, attrs)
#
# # Use `string_params_for` to generate maps with string keys. This can be useful
# # for Phoenix controller tests.
# string_params_for(:comment, attrs)
# string_params_with_assocs(:comment, attrs)
