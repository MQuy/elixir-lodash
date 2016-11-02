defmodule Lodash.StringTest do
  use ExUnit.Case

  test "words empty string" do
    assert [] == Lodash.String.words("")
  end

  test "words fred, barney, & pebbles" do
    assert ["fred", "barney", "pebbles"] == Lodash.String.words("fred, barney, & pebbles")
  end

  test "words fred, barney, & pebbles custom regex" do
    assert ["fred", "barney", "&", "pebbles"] == Lodash.String.words("fred, barney, & pebbles", ~r/[^, ]+/)
  end

  test "deburr empty string" do
    assert "" == Lodash.String.deburr("")
  end

  test "deburr minh quy" do
    assert "minh quy" == Lodash.String.deburr("minh quy")
  end

  test "deburr minh quý" do
    assert "minh quy" == Lodash.String.deburr("minh quý")
  end

  test "pascal_case empty string" do
    assert "" == Lodash.String.pascal_case("")
  end

  test "pascal_case Foo Bar" do
    assert "FooBar" == Lodash.String.pascal_case("Foo Bar")
  end

  test "pascal_case --foo-bar--" do
    assert "FooBar" == Lodash.String.pascal_case("--foo-bar--")
  end

  test "pascal_case __FOO_BAR__" do
    assert "FooBar" == Lodash.String.pascal_case("__FOO_BAR__")
  end

  test "camel_case empty string" do
    assert "" == Lodash.String.camel_case("")
  end

  test "camel_case Foo Bar" do
    assert "fooBar" == Lodash.String.camel_case("Foo Bar")
  end

  test "camel_case --foo-bar--" do
    assert "fooBar" == Lodash.String.camel_case("--foo-bar--")
  end

  test "camel_case __FOO_BAR__" do
    assert "fooBar" == Lodash.String.camel_case("__FOO_BAR__")
  end

  test "kebab_case empty string" do
    assert "" == Lodash.String.kebab_case("")
  end

  test "kebab_case Foo Bar" do
    assert "foo-bar" == Lodash.String.kebab_case("Foo Bar")
  end

  test "kebab_case fooBar" do
    assert "foo-bar" == Lodash.String.kebab_case("fooBar")
  end

  test "kebab_case __FOO_BAR__" do
    assert "foo-bar" == Lodash.String.kebab_case("__FOO_BAR__")
  end

  test "snake_case empty string" do
    assert "" == Lodash.String.snake_case("")
  end

  test "snake_case Foo Bar" do
    assert "foo_bar" == Lodash.String.snake_case("Foo Bar")
  end

  test "snake_case fooBar" do
    assert "foo_bar" == Lodash.String.snake_case("fooBar")
  end

  test "snake_case --FOO-BAR--" do
    assert "foo_bar" == Lodash.String.snake_case("--FOO-BAR--")
  end

  test "lower_case empty string" do
    assert "" == Lodash.String.lower_case("")
  end

  test "lower_case --Foo-Bar--" do
    assert "foo bar" == Lodash.String.lower_case("--Foo-Bar--")
  end

  test "lower_case fooBar" do
    assert "foo bar" == Lodash.String.lower_case("fooBar")
  end

  test "lower_case __FOO_BAR__" do
    assert "foo bar" == Lodash.String.lower_case("__FOO_BAR__")
  end

  test "start_case empty string" do
    assert "" == Lodash.String.start_case("")
  end

  test "start_case --foo-bar--" do
    assert "Foo Bar" == Lodash.String.start_case("--foo-bar--")
  end

  test "start_case fooBar" do
    assert "Foo Bar" == Lodash.String.start_case("fooBar")
  end

  test "start_case __FOO_BAR__" do
    assert "Foo Bar" == Lodash.String.start_case("__FOO_BAR__")
  end

  test "truncate empty string" do
    assert "..." == Lodash.String.truncate("")
  end

  test "truncate hi-diddly-ho there, neighborino" do
    assert "hi-diddly-ho there, neighborino..." == Lodash.String.truncate("hi-diddly-ho there, neighborino")
  end

  test "truncate hi-diddly-ho there, neighborino length" do
    assert "hi..." = Lodash.String.truncate("hi-diddly-ho there, neighborino", length: 5)
  end

  test "truncate hi-diddly-ho there, neighborino separator" do
    assert "hi-diddly-ho..." == Lodash.String.truncate("hi-diddly-ho there, neighborino", length: 15, separator: ~r/\s/)
  end

  test "truncate hi-diddly-ho there, neighborino omission" do
    assert "hi [...]" == Lodash.String.truncate("hi-diddly-ho there, neighborino", length: 8, omission: " [...]")
  end
end
