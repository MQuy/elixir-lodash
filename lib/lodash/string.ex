defmodule Lodash.String do
  @moduledoc """
  Specialized functions to manipulate Strings.
  """

  @re_word ~r/[^\x00-\x2f\x3a-\x40\x5b-\x60\x7b-\x7f]+/

  @doc """
  Split `str` into an array of its words.

  ## Examples
      iex> Lodash.String.words("fred, barney, & pebbles")
      ["fred", "barney", "pebbles"]
      iex> Lodash.String.words("fred, barney, & pebbles", ~r/[^, ]+/)
      ["fred", "barney", "&", "pebbles"]
  """
  def words(str, pattern \\ @re_word) do
    str
    |> String.split(pattern, trim: true, include_captures: true)
    |> Enum.filter(&(String.match?(&1, pattern)))
  end

  @doc """
  Deburrs `str` by converting unicode into ascii.

  ## Examples
      iex> Lodash.String.deburr("minh quý")
      "minh quy"
  """
  def deburr(str) do
    str
    |> String.normalize(:nfd)
    |> String.replace(~r/[^\x00-\x7F]/u, "")
  end

  @doc """
  Convert `str` by to [pascal case](https://en.wikipedia.org/wiki/PascalCase).

  ## Examples
      iex> Lodash.String.pascal_case("Foo Bar")
      "FooBar"
      iex> Lodash.String.pascal_case("--foo-bar--")
      "FooBar"
      iex> Lodash.String.pascal_case("__FOO_BAR__")
      "FooBar"
  """
  def pascal_case(str) do
    str
    |> case_words
    |> Enum.map(&(String.capitalize(&1)))
    |> Enum.join
  end

  @doc """
  Converts `str` to [camel case](https://en.wikipedia.org/wiki/CamelCase)

  ## Examples
      iex> Lodash.String.camel_case("Foo Bar")
      "fooBar"
      iex> Lodash.String.camel_case("--foo-bar--")
      "fooBar"
      iex> Lodash.String.camel_case("__FOO_BAR__")
      "fooBar"
  """
  def camel_case(str) do
    str
    |> case_words
    |> Stream.with_index
    |> Enum.map(fn {elem, i} ->
      if i == 0, do: String.downcase(elem), else: String.capitalize(elem)
    end)
    |> Enum.join
  end

  @doc """
  Converts `str` to [kebab case](https://en.wikipedia.org/wiki/Letter_case#Special_case_styles)

  ## Examples
      iex> Lodash.String.kebab_case("Foo Bar")
      "foo-bar"
      iex> Lodash.String.kebab_case("--foo-bar--")
      "foo-bar"
      iex> Lodash.String.kebab_case("__FOO_BAR__")
      "foo-bar"
  """
  def kebab_case(str) do
    str
    |> case_words
    |> Enum.map(&(String.downcase(&1)))
    |> Enum.join("-")
  end

  @doc """
  Converts `str` to [snake case](https://en.wikipedia.org/wiki/Snake_case)

  ## Examples
      iex> Lodash.String.snake_case("Foo Bar")
      "foo_bar"
      iex> Lodash.String.snake_case("--foo-bar--")
      "foo_bar"
      iex> Lodash.String.snake_case("__FOO_BAR__")
      "foo_bar"
  """
  def snake_case(str) do
    str
    |> case_words
    |> Enum.map(&(String.downcase(&1)))
    |> Enum.join("_")
  end

  @doc """
  Converts `str` to lower case

  ## Examples
      iex> Lodash.String.lower_case("Foo Bar")
      "foo bar"
      iex> Lodash.String.lower_case("--foo-bar--")
      "foo bar"
      iex> Lodash.String.lower_case("__FOO_BAR__")
      "foo bar"
  """
  def lower_case(str) do
    str
    |> case_words
    |> Enum.map(&(String.downcase(&1)))
    |> Enum.join(" ")
  end

  @doc """
  Converts `str` to start case

  ## Examples
      iex> Lodash.String.start_case("Foo Bar")
      "Foo Bar"
      iex> Lodash.String.start_case("--foo-bar--")
      "Foo Bar"
      iex> Lodash.String.start_case("__FOO_BAR__")
      "Foo Bar"
  """
  def start_case(str) do
    str
    |> case_words
    |> Enum.map(&(String.capitalize(&1)))
    |> Enum.join(" ")
  end

  @doc """
  Truncates `str` if it's longer than the given maximum string length. The last characters of the truncated string are replaced with the omission string which defaults to "..."

  ## Examples
      iex> Lodash.String.truncate("hi-minh quy")
      "hi-minh quy"
      iex> Lodash.String.truncate("hi-minh quy", length: 4)
      "h..."
      iex> Lodash.String.truncate("hi-minh quy", length: 10, separator: ~r/\s/)
      "hi-minh..."
      iex> Lodash.String.truncate("hi-minh quy", length: 10, omission: " ...")
      "hi-min ..."
  """
  def truncate(str, options \\ []) do
    length = Keyword.get(options, :length, 80)
    separator = Keyword.get(options, :separator, ~r//)
    omission = Keyword.get(options, :omission, "...")

    if String.length(str) > length do
      truncate_str =
        str
        |> String.split(separator, trim: true, include_captures: true)
        |> Enum.reduce_while("", fn(elem, acc) ->
          if String.length(acc <> elem <> omission) <= length, do: {:cont, acc <> elem}, else: {:halt, acc}
        end)
      truncate_str <> omission
    else
      str
    end
  end

  defp case_words(str) do
    str
    |> deburr
    |> String.replace(~r/([A-Z]+)/, " \\1")
    |> words
  end
end
