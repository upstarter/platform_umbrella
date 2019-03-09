defmodule Platform.TaggingsTest do
  use Platform.DataCase

  alias Platform.Taggings

  describe "taggings" do
    alias Platform.Taggings.Tagging

    @valid_attrs %{tag_id: 42, tagged_id: 42}
    @update_attrs %{tag_id: 43, tagged_id: 43}
    @invalid_attrs %{tag_id: nil, tagged_id: nil}

    def tagging_fixture(attrs \\ %{}) do
      {:ok, tagging} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Taggings.create_tagging()

      tagging
    end

    test "list_taggings/0 returns all taggings" do
      tagging = tagging_fixture()
      assert Taggings.list_taggings() == [tagging]
    end

    test "get_tagging!/1 returns the tagging with given id" do
      tagging = tagging_fixture()
      assert Taggings.get_tagging!(tagging.id) == tagging
    end

    test "create_tagging/1 with valid data creates a tagging" do
      assert {:ok, %Tagging{} = tagging} = Taggings.create_tagging(@valid_attrs)
      assert tagging.tag_id == 42
      assert tagging.tagged_id == 42
    end

    test "create_tagging/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Taggings.create_tagging(@invalid_attrs)
    end

    test "update_tagging/2 with valid data updates the tagging" do
      tagging = tagging_fixture()
      assert {:ok, tagging} = Taggings.update_tagging(tagging, @update_attrs)
      assert %Tagging{} = tagging
      assert tagging.tag_id == 43
      assert tagging.tagged_id == 43
    end

    test "update_tagging/2 with invalid data returns error changeset" do
      tagging = tagging_fixture()
      assert {:error, %Ecto.Changeset{}} = Taggings.update_tagging(tagging, @invalid_attrs)
      assert tagging == Taggings.get_tagging!(tagging.id)
    end

    test "delete_tagging/1 deletes the tagging" do
      tagging = tagging_fixture()
      assert {:ok, %Tagging{}} = Taggings.delete_tagging(tagging)
      assert_raise Ecto.NoResultsError, fn -> Taggings.get_tagging!(tagging.id) end
    end

    test "change_tagging/1 returns a tagging changeset" do
      tagging = tagging_fixture()
      assert %Ecto.Changeset{} = Taggings.change_tagging(tagging)
    end
  end

  describe "taggings" do
    alias Platform.Taggings.Tagging

    @valid_attrs %{tagged_id: 42, topic_id: 42}
    @update_attrs %{tagged_id: 43, topic_id: 43}
    @invalid_attrs %{tagged_id: nil, topic_id: nil}

    def tagging_fixture(attrs \\ %{}) do
      {:ok, tagging} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Taggings.create_tagging()

      tagging
    end

    test "list_taggings/0 returns all taggings" do
      tagging = tagging_fixture()
      assert Taggings.list_taggings() == [tagging]
    end

    test "get_tagging!/1 returns the tagging with given id" do
      tagging = tagging_fixture()
      assert Taggings.get_tagging!(tagging.id) == tagging
    end

    test "create_tagging/1 with valid data creates a tagging" do
      assert {:ok, %Tagging{} = tagging} = Taggings.create_tagging(@valid_attrs)
      assert tagging.tagged_id == 42
      assert tagging.topic_id == 42
    end

    test "create_tagging/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Taggings.create_tagging(@invalid_attrs)
    end

    test "update_tagging/2 with valid data updates the tagging" do
      tagging = tagging_fixture()
      assert {:ok, tagging} = Taggings.update_tagging(tagging, @update_attrs)
      assert %Tagging{} = tagging
      assert tagging.tagged_id == 43
      assert tagging.topic_id == 43
    end

    test "update_tagging/2 with invalid data returns error changeset" do
      tagging = tagging_fixture()
      assert {:error, %Ecto.Changeset{}} = Taggings.update_tagging(tagging, @invalid_attrs)
      assert tagging == Taggings.get_tagging!(tagging.id)
    end

    test "delete_tagging/1 deletes the tagging" do
      tagging = tagging_fixture()
      assert {:ok, %Tagging{}} = Taggings.delete_tagging(tagging)
      assert_raise Ecto.NoResultsError, fn -> Taggings.get_tagging!(tagging.id) end
    end

    test "change_tagging/1 returns a tagging changeset" do
      tagging = tagging_fixture()
      assert %Ecto.Changeset{} = Taggings.change_tagging(tagging)
    end
  end
end
