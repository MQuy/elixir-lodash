defmodule Lodash.CollectionTest do
  use ExUnit.Case

  test "compact empty" do
    assert [] == Lodash.Collection.compact([])
  end

  test "compact one nil" do
    assert [1, 2] == Lodash.Collection.compact([1, 2, nil])
  end

  test "difference empty" do
    assert [] == Lodash.Collection.difference([], [])
  end

  test "difference two sets" do
    assert [1] == Lodash.Collection.difference([1, 2], [2, 3])
  end

  test "difference_by empty" do
    assert [] == Lodash.Collection.difference_by([], [], fn(_) -> true end)
  end

  test "difference_by two sets" do
    assert [2.2] == Lodash.Collection.difference_by([1.1, 2.2], [1.2, 3.0], fn(x, y) -> Float.floor(x) == Float.floor(y) end)
  end

  test "intersection empty" do
    assert [] == Lodash.Collection.intersection([], [])
  end

  test "intersection two sets" do
    assert [1] == Lodash.Collection.intersection([1, 2], [1, 3])
  end

  test "intersection_by empty" do
    assert [] == Lodash.Collection.intersection_by([], [], fn(_, _) -> true end)
  end

  test "intersection_by two sets" do
    assert [1.1] == Lodash.Collection.intersection_by([1.1, 2.2], [1.2, 3.0], fn(x, y) -> Float.floor(x) == Float.floor(y) end)
  end

  test "pull empty" do
    assert [] == Lodash.Collection.pull([], "")
  end

  test "pull specific value" do
    assert [2] == Lodash.Collection.pull([1, 2], 1)
  end

  test "pull_all empty" do
    assert [] == Lodash.Collection.pull_all([], [])
  end

  test "pull_all two sets" do
    assert [1, 2] == Lodash.Collection.pull_all([1, 2, 3], [3, 4])
  end

  test "union empty" do
    assert [] == Lodash.Collection.union([], [])
  end

  test "union two sets" do
    assert [1, 2, 3] == Lodash.Collection.union([1, 2], [2, 3])
  end

  test "union_by empty" do
    assert [] == Lodash.Collection.union_by([], [], fn(_) -> true end)
  end

  test "union_by two sets" do
    assert [1, 2] == Lodash.Collection.union_by([1, 2, 3], [4, 5, 6], fn(x) -> x == 1 end)
  end
end
