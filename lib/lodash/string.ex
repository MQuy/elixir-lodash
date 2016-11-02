defmodule Lodash.String do
  @re_word ~r/[^\x00-\x2f\x3a-\x40\x5b-\x60\x7b-\x7f]+/

  def words(str, regex \\ @re_word) do
    str
      |> String.split(regex, trim: true, include_captures: true)
      |> Enum.filter(&(String.match?(&1, regex)))
  end

  def deburr(str) do
    str |> String.normalize(:nfd) |> String.replace(~r/[^\x00-\x7F]/u, "")
  end

  def pascal_case(str) do
    str
      |> case_words
      |> Enum.map(&(String.capitalize(&1)))
      |> Enum.join
  end

  def camel_case(str) do
    pascal = pascal_case(str)
    (pascal |> String.first |> String.downcase) <> (pascal |> String.slice(1..-1))
  end

  def kebab_case(str) do
    str
      |> case_words
      |> Enum.map(&(String.downcase(&1)))
      |> Enum.join("-")
  end

  def snake_case(str) do
    str
      |> case_words
      |> Enum.map(&(String.downcase(&1)))
      |> Enum.join("_")
  end

  def truncate(str, options) do
    length = Keyword.get(options, :length, 80)
    separator = Keyword.get(options, :separator, ~r//)
    omission = Keyword.get(options, :omission, "...")

    truncate_str = str
      |> String.split(separator, trim: true, include_captures: true)
      |> Enum.reduce_while("", fn(elem, acc) ->
        if String.length(acc <> elem <> omission) <= length, do: {:cont, acc <> elem}, else: {:halt, acc}
      end)
    truncate_str <> omission
  end

  defp case_words(str) do
    str
      |> deburr
      |> String.replace(~r/([A-Z]+)/, " \\1")
      |> words
  end
end
