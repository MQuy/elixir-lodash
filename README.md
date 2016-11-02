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
