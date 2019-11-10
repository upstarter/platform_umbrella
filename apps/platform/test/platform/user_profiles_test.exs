defmodule Platform.UserProfilesTest do
  use Platform.DataCase

  alias Platform.UserProfiles

  describe "user_profiles" do
    alias Platform.UserProfiles.UserProfile

    @valid_attrs %{role: "some role"}
    @update_attrs %{role: "some updated role"}
    @invalid_attrs %{role: nil}

    def user_profile_fixture(attrs \\ %{}) do
      {:ok, user_profile} =
        attrs
        |> Enum.into(@valid_attrs)
        |> UserProfiles.create_user_profile()

      user_profile
    end

    test "list_user_profiles/0 returns all user_profiles" do
      user_profile = user_profile_fixture()
      assert UserProfiles.list_user_profiles() == [user_profile]
    end

    test "get_user_profile!/1 returns the user_profile with given id" do
      user_profile = user_profile_fixture()
      assert UserProfiles.get_user_profile!(user_profile.id) == user_profile
    end

    test "create_user_profile/1 with valid data creates a user_profile" do
      assert {:ok, %UserProfile{} = user_profile} = UserProfiles.create_user_profile(@valid_attrs)
      assert user_profile.role == "some role"
    end

    test "create_user_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = UserProfiles.create_user_profile(@invalid_attrs)
    end

    test "update_user_profile/2 with valid data updates the user_profile" do
      user_profile = user_profile_fixture()
      assert {:ok, %UserProfile{} = user_profile} = UserProfiles.update_user_profile(user_profile, @update_attrs)
      assert user_profile.role == "some updated role"
    end

    test "update_user_profile/2 with invalid data returns error changeset" do
      user_profile = user_profile_fixture()
      assert {:error, %Ecto.Changeset{}} = UserProfiles.update_user_profile(user_profile, @invalid_attrs)
      assert user_profile == UserProfiles.get_user_profile!(user_profile.id)
    end

    test "delete_user_profile/1 deletes the user_profile" do
      user_profile = user_profile_fixture()
      assert {:ok, %UserProfile{}} = UserProfiles.delete_user_profile(user_profile)
      assert_raise Ecto.NoResultsError, fn -> UserProfiles.get_user_profile!(user_profile.id) end
    end

    test "change_user_profile/1 returns a user_profile changeset" do
      user_profile = user_profile_fixture()
      assert %Ecto.Changeset{} = UserProfiles.change_user_profile(user_profile)
    end
  end
end
