defmodule Platform.InvestorsTest do
  use Platform.DataCase

  alias Platform.Investors

  describe "investors" do
    alias Platform.Investors.Investor

    @valid_attrs %{auth_account_id: 42}
    @update_attrs %{auth_account_id: 43}
    @invalid_attrs %{auth_account_id: nil}

    def investor_fixture(attrs \\ %{}) do
      {:ok, investor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Investors.create_investor()

      investor
    end

    test "list_investors/0 returns all investors" do
      investor = investor_fixture()
      assert Investors.list_investors() == [investor]
    end

    test "get_investor!/1 returns the investor with given id" do
      investor = investor_fixture()
      assert Investors.get_investor!(investor.id) == investor
    end

    test "create_investor/1 with valid data creates a investor" do
      assert {:ok, %Investor{} = investor} = Investors.create_investor(@valid_attrs)
      assert investor.auth_account_id == 42
    end

    test "create_investor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Investors.create_investor(@invalid_attrs)
    end

    test "update_investor/2 with valid data updates the investor" do
      investor = investor_fixture()
      assert {:ok, investor} = Investors.update_investor(investor, @update_attrs)
      assert %Investor{} = investor
      assert investor.auth_account_id == 43
    end

    test "update_investor/2 with invalid data returns error changeset" do
      investor = investor_fixture()
      assert {:error, %Ecto.Changeset{}} = Investors.update_investor(investor, @invalid_attrs)
      assert investor == Investors.get_investor!(investor.id)
    end

    test "delete_investor/1 deletes the investor" do
      investor = investor_fixture()
      assert {:ok, %Investor{}} = Investors.delete_investor(investor)
      assert_raise Ecto.NoResultsError, fn -> Investors.get_investor!(investor.id) end
    end

    test "change_investor/1 returns a investor changeset" do
      investor = investor_fixture()
      assert %Ecto.Changeset{} = Investors.change_investor(investor)
    end
  end

  describe "investors" do
    alias Platform.Investors.Investor

    @valid_attrs %{avatar_url: "some avatar_url", email: "some email", name: "some name"}
    @update_attrs %{
      avatar_url: "some updated avatar_url",
      email: "some updated email",
      name: "some updated name"
    }
    @invalid_attrs %{avatar_url: nil, email: nil, name: nil}

    def investor_fixture(attrs \\ %{}) do
      {:ok, investor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Investors.create_investor()

      investor
    end

    test "list_investors/0 returns all investors" do
      investor = investor_fixture()
      assert Investors.list_investors() == [investor]
    end

    test "get_investor!/1 returns the investor with given id" do
      investor = investor_fixture()
      assert Investors.get_investor!(investor.id) == investor
    end

    test "create_investor/1 with valid data creates a investor" do
      assert {:ok, %Investor{} = investor} = Investors.create_investor(@valid_attrs)
      assert investor.avatar_url == "some avatar_url"
      assert investor.email == "some email"
      assert investor.name == "some name"
    end

    test "create_investor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Investors.create_investor(@invalid_attrs)
    end

    test "update_investor/2 with valid data updates the investor" do
      investor = investor_fixture()
      assert {:ok, investor} = Investors.update_investor(investor, @update_attrs)
      assert %Investor{} = investor
      assert investor.avatar_url == "some updated avatar_url"
      assert investor.email == "some updated email"
      assert investor.name == "some updated name"
    end

    test "update_investor/2 with invalid data returns error changeset" do
      investor = investor_fixture()
      assert {:error, %Ecto.Changeset{}} = Investors.update_investor(investor, @invalid_attrs)
      assert investor == Investors.get_investor!(investor.id)
    end

    test "delete_investor/1 deletes the investor" do
      investor = investor_fixture()
      assert {:ok, %Investor{}} = Investors.delete_investor(investor)
      assert_raise Ecto.NoResultsError, fn -> Investors.get_investor!(investor.id) end
    end

    test "change_investor/1 returns a investor changeset" do
      investor = investor_fixture()
      assert %Ecto.Changeset{} = Investors.change_investor(investor)
    end
  end
end
