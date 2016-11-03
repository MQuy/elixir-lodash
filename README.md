# Lodash

## Installation

This package can be installed as:

  1. Add `lodash` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:lodash, "~> 0.1.0"}]
    end
    ```

  2. Ensure `lodash` is started before your application:

    ```elixir
    def application do
      [applications: [:lodash]]
    end
    ```
## Docs

Read more at [hex](https://hexdocs.pm/lodash/api-reference.html)

## Examples

### String

```elixir
  iex> Lodash.String.words("erlang elixir")
  ["erlang", "elixir"]

  iex> Lodash.String.deburr("déjà vu")
  "deja vu"

  iex> Lodash.String.pascal_case("Pascal CASE")
  "PascalCase"

  iex> Lodash.String.camel_case("---CAMEL--CASE")
  "camelCase"

  iex> Lodash.String.kebab_case("Kebab__CASE")
  "kebab-case"

  iex> Lodash.String.snake_case("Snake CASE")
  "snake_case"

  iex> Lodash.String.lower_case("Lower case")
  "lower case"

  iex> Lodash.String.start_case("START CASE")
  "Start Case"

  iex> Lodash.String.truncate("pokemon go", length: 5)
  "pok..."
```

## Collection

```elixir
  iex> Lodash.Collection.compact([1, 2, nil])
  [1, 2]
  iex> Lodash.Collection.difference([1, 2], [2, 3])
  [1]
  iex> Lodash.Collection.difference_by([1.1, 2.2], [1.2, 3.0], fn(x, y) -> Float.floor(x) == Float.floor(y) end)
  [2.2]
  iex> Lodash.Collection.intersection([1, 2], [2, 3])
  [2]
  iex> Lodash.Collection.intersection_by([1.1, 2.2], [1.2, 3.0], fn(x, y) -> Float.floor(x) == Float.floor(y) end)
  [1.1]
  iex> Lodash.Collection.pull([1, 2], 1)
  [2]
  iex> Lodash.Collection.pull_all([1, 2, 3], [2, 3])
  [1]
  iex> Lodash.Collection.union([1, 2], [2, 3])
  [1, 2, 3]
  iex> Lodash.Collection.union_by([1, 2, 3], [4, 5, 6], fn(x) -> x == 1 end)
  [1, 2]
```
