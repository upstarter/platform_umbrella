defmodule Platform.StrategiesTest do
  use Platform.DataCase

  alias Platform.Strategies

  describe "strategies" do
    alias Platform.Strategies.Strategy

    @valid_attrs %{long_desc: "some long_desc", name: "some name", short_desc: "some short_desc", tagging_id: 42, type: "some type"}
    @update_attrs %{long_desc: "some updated long_desc", name: "some updated name", short_desc: "some updated short_desc", tagging_id: 43, type: "some updated type"}
    @invalid_attrs %{long_desc: nil, name: nil, short_desc: nil, tagging_id: nil, type: nil}

    def strategy_fixture(attrs \\ %{}) do
      {:ok, strategy} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Strategies.create_strategy()

      strategy
    end

    test "list_strategies/0 returns all strategies" do
      strategy = strategy_fixture()
      assert Strategies.list_strategies() == [strategy]
    end

    test "get_strategy!/1 returns the strategy with given id" do
      strategy = strategy_fixture()
      assert Strategies.get_strategy!(strategy.id) == strategy
    end

    test "create_strategy/1 with valid data creates a strategy" do
      assert {:ok, %Strategy{} = strategy} = Strategies.create_strategy(@valid_attrs)
      assert strategy.long_desc == "some long_desc"
      assert strategy.name == "some name"
      assert strategy.short_desc == "some short_desc"
      assert strategy.tagging_id == 42
      assert strategy.type == "some type"
    end

    test "create_strategy/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Strategies.create_strategy(@invalid_attrs)
    end

    test "update_strategy/2 with valid data updates the strategy" do
      strategy = strategy_fixture()
      assert {:ok, strategy} = Strategies.update_strategy(strategy, @update_attrs)
      assert %Strategy{} = strategy
      assert strategy.long_desc == "some updated long_desc"
      assert strategy.name == "some updated name"
      assert strategy.short_desc == "some updated short_desc"
      assert strategy.tagging_id == 43
      assert strategy.type == "some updated type"
    end

    test "update_strategy/2 with invalid data returns error changeset" do
      strategy = strategy_fixture()
      assert {:error, %Ecto.Changeset{}} = Strategies.update_strategy(strategy, @invalid_attrs)
      assert strategy == Strategies.get_strategy!(strategy.id)
    end

    test "delete_strategy/1 deletes the strategy" do
      strategy = strategy_fixture()
      assert {:ok, %Strategy{}} = Strategies.delete_strategy(strategy)
      assert_raise Ecto.NoResultsError, fn -> Strategies.get_strategy!(strategy.id) end
    end

    test "change_strategy/1 returns a strategy changeset" do
      strategy = strategy_fixture()
      assert %Ecto.Changeset{} = Strategies.change_strategy(strategy)
    end
  end
end
