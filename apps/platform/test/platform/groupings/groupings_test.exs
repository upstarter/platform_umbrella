defmodule Platform.GroupingsTest do
  use Platform.DataCase

  alias Platform.Groupings

  describe "groupings" do
    alias Platform.Groupings.Grouping

    @valid_attrs %{group_id: 42, group_type: "some group_type", member_id: 42, member_type: "some member_type"}
    @update_attrs %{group_id: 43, group_type: "some updated group_type", member_id: 43, member_type: "some updated member_type"}
    @invalid_attrs %{group_id: nil, group_type: nil, member_id: nil, member_type: nil}

    def grouping_fixture(attrs \\ %{}) do
      {:ok, grouping} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Groupings.create_grouping()

      grouping
    end

    test "list_groupings/0 returns all groupings" do
      grouping = grouping_fixture()
      assert Groupings.list_groupings() == [grouping]
    end

    test "get_grouping!/1 returns the grouping with given id" do
      grouping = grouping_fixture()
      assert Groupings.get_grouping!(grouping.id) == grouping
    end

    test "create_grouping/1 with valid data creates a grouping" do
      assert {:ok, %Grouping{} = grouping} = Groupings.create_grouping(@valid_attrs)
      assert grouping.group_id == 42
      assert grouping.group_type == "some group_type"
      assert grouping.member_id == 42
      assert grouping.member_type == "some member_type"
    end

    test "create_grouping/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Groupings.create_grouping(@invalid_attrs)
    end

    test "update_grouping/2 with valid data updates the grouping" do
      grouping = grouping_fixture()
      assert {:ok, grouping} = Groupings.update_grouping(grouping, @update_attrs)
      assert %Grouping{} = grouping
      assert grouping.group_id == 43
      assert grouping.group_type == "some updated group_type"
      assert grouping.member_id == 43
      assert grouping.member_type == "some updated member_type"
    end

    test "update_grouping/2 with invalid data returns error changeset" do
      grouping = grouping_fixture()
      assert {:error, %Ecto.Changeset{}} = Groupings.update_grouping(grouping, @invalid_attrs)
      assert grouping == Groupings.get_grouping!(grouping.id)
    end

    test "delete_grouping/1 deletes the grouping" do
      grouping = grouping_fixture()
      assert {:ok, %Grouping{}} = Groupings.delete_grouping(grouping)
      assert_raise Ecto.NoResultsError, fn -> Groupings.get_grouping!(grouping.id) end
    end

    test "change_grouping/1 returns a grouping changeset" do
      grouping = grouping_fixture()
      assert %Ecto.Changeset{} = Groupings.change_grouping(grouping)
    end
  end
end
