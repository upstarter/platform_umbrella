defmodule Platform.SystemsTest do
  use Platform.DataCase

  alias Platform.Systems

  describe "systems" do
    alias Platform.Systems.System

    @valid_attrs %{description: "some description", name: "some name", short_desc: "some short_desc"}
    @update_attrs %{description: "some updated description", name: "some updated name", short_desc: "some updated short_desc"}
    @invalid_attrs %{description: nil, name: nil, short_desc: nil}

    def system_fixture(attrs \\ %{}) do
      {:ok, system} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Systems.create_system()

      system
    end

    test "list_systems/0 returns all systems" do
      system = system_fixture()
      assert Systems.list_systems() == [system]
    end

    test "get_system!/1 returns the system with given id" do
      system = system_fixture()
      assert Systems.get_system!(system.id) == system
    end

    test "create_system/1 with valid data creates a system" do
      assert {:ok, %System{} = system} = Systems.create_system(@valid_attrs)
      assert system.description == "some description"
      assert system.name == "some name"
      assert system.short_desc == "some short_desc"
    end

    test "create_system/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Systems.create_system(@invalid_attrs)
    end

    test "update_system/2 with valid data updates the system" do
      system = system_fixture()
      assert {:ok, system} = Systems.update_system(system, @update_attrs)
      assert %System{} = system
      assert system.description == "some updated description"
      assert system.name == "some updated name"
      assert system.short_desc == "some updated short_desc"
    end

    test "update_system/2 with invalid data returns error changeset" do
      system = system_fixture()
      assert {:error, %Ecto.Changeset{}} = Systems.update_system(system, @invalid_attrs)
      assert system == Systems.get_system!(system.id)
    end

    test "delete_system/1 deletes the system" do
      system = system_fixture()
      assert {:ok, %System{}} = Systems.delete_system(system)
      assert_raise Ecto.NoResultsError, fn -> Systems.get_system!(system.id) end
    end

    test "change_system/1 returns a system changeset" do
      system = system_fixture()
      assert %Ecto.Changeset{} = Systems.change_system(system)
    end
  end
end
