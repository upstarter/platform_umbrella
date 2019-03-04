defmodule Platform.AnalystsTest do
  use Platform.DataCase

  alias Platform.Analysts

  describe "analysts" do
    alias Platform.Analysts.Analyst

    @valid_attrs %{avatar_url: "some avatar_url", email: "some email", name: "some name"}
    @update_attrs %{avatar_url: "some updated avatar_url", email: "some updated email", name: "some updated name"}
    @invalid_attrs %{avatar_url: nil, email: nil, name: nil}

    def analyst_fixture(attrs \\ %{}) do
      {:ok, analyst} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Analysts.create_analyst()

      analyst
    end

    test "list_analysts/0 returns all analysts" do
      analyst = analyst_fixture()
      assert Analysts.list_analysts() == [analyst]
    end

    test "get_analyst!/1 returns the analyst with given id" do
      analyst = analyst_fixture()
      assert Analysts.get_analyst!(analyst.id) == analyst
    end

    test "create_analyst/1 with valid data creates a analyst" do
      assert {:ok, %Analyst{} = analyst} = Analysts.create_analyst(@valid_attrs)
      assert analyst.avatar_url == "some avatar_url"
      assert analyst.email == "some email"
      assert analyst.name == "some name"
    end

    test "create_analyst/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Analysts.create_analyst(@invalid_attrs)
    end

    test "update_analyst/2 with valid data updates the analyst" do
      analyst = analyst_fixture()
      assert {:ok, analyst} = Analysts.update_analyst(analyst, @update_attrs)
      assert %Analyst{} = analyst
      assert analyst.avatar_url == "some updated avatar_url"
      assert analyst.email == "some updated email"
      assert analyst.name == "some updated name"
    end

    test "update_analyst/2 with invalid data returns error changeset" do
      analyst = analyst_fixture()
      assert {:error, %Ecto.Changeset{}} = Analysts.update_analyst(analyst, @invalid_attrs)
      assert analyst == Analysts.get_analyst!(analyst.id)
    end

    test "delete_analyst/1 deletes the analyst" do
      analyst = analyst_fixture()
      assert {:ok, %Analyst{}} = Analysts.delete_analyst(analyst)
      assert_raise Ecto.NoResultsError, fn -> Analysts.get_analyst!(analyst.id) end
    end

    test "change_analyst/1 returns a analyst changeset" do
      analyst = analyst_fixture()
      assert %Ecto.Changeset{} = Analysts.change_analyst(analyst)
    end
  end
end
