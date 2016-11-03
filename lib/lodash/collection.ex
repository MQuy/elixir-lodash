defmodule Lodash.Collection do
  @moduledoc """
  Specialized functions to manipulate enumerable.
  """

  @doc """
  Create an enumerable with all falsey values removed.

  ## Examples
      iex> Lodash.Collection.compact([1, 2, nil])
      [1, 2]
  """
  def compact(collection) do
    collection |> Enum.filter(&(&1))
  end

  @doc """
  Create an enumerable from collection1 whose values are not included collection2.

  ## Examples
      iex> Lodash.Collection.difference([1, 2], [2, 3])
      [1]
  """
  def difference(collection1, collection2) do
    collection1 |> Enum.reject(&(Enum.member?(collection2, &1)))
  end

  @doc """
  The method is like `difference` except that it accepts interatee to compare.

  ## Examples
      iex> Lodash.Collection.difference_by([1.1, 2.2], [1.2, 3.0], fn(x, y) -> Float.floor(x) == Float.floor(y) end)
      [2.2]
  """
  def difference_by(collection1, collection2, func) do
    collection1
    |> Enum.reject(fn(elem1) ->
        collection2 |> Enum.find(fn(elem2) -> func.(elem1, elem2) end)
      end)
  end

  @doc """
  Create an enumerable of unique values that are included in all given from collection1, collection2.

  ## Examples
      iex> Lodash.Collection.intersection([1, 2], [2, 3])
      [2]
  """
  def intersection(collection1, collection2) do
    collection1
    |> Enum.filter(&(Enum.member?(collection2, &1)))
  end

  @doc """
  The method is like `intersection` except that it accepts interatee to compare

  ## Examples
      iex> Lodash.Collection.intersection_by([1.1, 2.2], [1.2, 3.0], fn(x, y) -> Float.floor(x) == Float.floor(y) end)
      [1.1]
  """
  def intersection_by(collection1, collection2, func) do
    collection1
    |> Enum.filter(fn(elem1) ->
        collection2 |> Enum.find(fn(elem2) -> func.(elem1, elem2) end)
      end)
  end

  @doc """
  Remove all given values from collection which has the same value as `key`

  ## Examples
      iex> Lodash.Collection.pull([1, 2], 1)
      [2]
  """
  def pull(collection, key) do
    collection |> Enum.reject(&(key === &1))
  end

  @doc """
  The method is like `pull` except it from collection.

  ## Examples
      iex> Lodash.Collection.pull_all([1, 2, 3], [3, 4])
      [1, 2]
  """
  def pull_all(collection1, collection2) do
    collection1
    |> Enum.reject(fn(elem1) ->
        collection2 |> Enum.find(&(&1 == elem1))
      end)
  end

  @doc """
  Create an enumerable of unique values from all given values.

  ## Examples
      iex> Lodash.Collection.union([1, 2], [2, 3])
      [1, 2, 3]
  """
  def union(collection1, collection2) do
    collection1
    |> Enum.concat(collection2)
    |> Enum.uniq
  end

  @doc """
  The method is like `union` except it accepts interatee.

  ## Examples
      iex> Lodash.Collection.union_by([1, 2, 3], [4, 5, 6], fn(x) -> rem(x, 2) == 0 end)
      [1, 2]
  """
  def union_by(collection1, collection2, func) do
    collection1
    |> Enum.concat(collection2)
    |> Enum.uniq_by(func)
  end
end
