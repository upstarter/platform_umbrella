defmodule Platform.GroupsTest do
  use Platform.DataCase

  alias Platform.Groups

  describe "groups" do
    alias Platform.Groups.Group

    @valid_attrs %{name: "some name", short_desc: "some short_desc", type: "some type"}
    @update_attrs %{
      name: "some updated name",
      short_desc: "some updated short_desc",
      type: "some updated type"
    }
    @invalid_attrs %{name: nil, short_desc: nil, type: nil}

    def group_fixture(attrs \\ %{}) do
      {:ok, group} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Groups.create_group()

      group
    end

    test "list_groups/0 returns all groups" do
      group = group_fixture()
      assert Groups.list_groups() == [group]
    end

    test "get_group!/1 returns the group with given id" do
      group = group_fixture()
      assert Groups.get_group!(group.id) == group
    end

    test "create_group/1 with valid data creates a group" do
      assert {:ok, %Group{} = group} = Groups.create_group(@valid_attrs)
      assert group.name == "some name"
      assert group.short_desc == "some short_desc"
      assert group.type == "some type"
    end

    test "create_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Groups.create_group(@invalid_attrs)
    end

    test "update_group/2 with valid data updates the group" do
      group = group_fixture()
      assert {:ok, group} = Groups.update_group(group, @update_attrs)
      assert %Group{} = group
      assert group.name == "some updated name"
      assert group.short_desc == "some updated short_desc"
      assert group.type == "some updated type"
    end

    test "update_group/2 with invalid data returns error changeset" do
      group = group_fixture()
      assert {:error, %Ecto.Changeset{}} = Groups.update_group(group, @invalid_attrs)
      assert group == Groups.get_group!(group.id)
    end

    test "delete_group/1 deletes the group" do
      group = group_fixture()
      assert {:ok, %Group{}} = Groups.delete_group(group)
      assert_raise Ecto.NoResultsError, fn -> Groups.get_group!(group.id) end
    end

    test "change_group/1 returns a group changeset" do
      group = group_fixture()
      assert %Ecto.Changeset{} = Groups.change_group(group)
    end
  end
end
