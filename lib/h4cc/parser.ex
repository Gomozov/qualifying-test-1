defmodule H4cc.Parser do
  require Logger

  @moduledoc """
  Parser works with a List of Strings. 
  """
  
  @doc """
    Parse List of Strings from file README.md. 

    Takes List of strings like:
    
    ["# Awesome Elixir [![Build Status](https://api.travis-ci.org/h4cc/awesome-elixir.svg?branch=master)](https://travis-ci.org/h4cc/awesome-elixir) [![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)",
    "A curated list of amazingly awesome Elixir libraries, resources, and shiny things inspired by [awesome-php](https://github.com/ziadoz/awesome-php).",
    "If you think a package should be added, please add a :+1: (`:+1:`) at the according issue or create a new one.",
    "There are [other sites with curated lists of elixir packages](#other-awesome-lists) which you can have a look at.",
    "- [Awesome Elixir](#awesome-elixir)", 
    "    - [Actors](#actors)",
    "    - [Algorithms and Data structures](#algorithms-and-data-structures)", 
    "    - [Applications](#applications)",
    "    - [Artificial Intelligence](#artificial-intelligence)", "    - [Audio and Sounds](#audio-and-sounds)",
    "    - [Authentication](#authentication)", 
    "    - [Authorization](#authorization)", ...]
    
    Returns Map with libraries like:

    %{"Formulars" => [%{desc: "Erlang Business Documents Generator.", name: "forms", url: "https://github.com/spawnproc/forms"}],
    "Miscellaneous" => [%{desc: "Library for parsing US Addresses into their individual parts.", name: "address_us", url: "https://github.com/smashedtoatoms/address_us"}, ...]}

  ## Examples
      iex> H4cc.Parser.parse_file(file)
      %{"Formulars" => [%{desc: "Erlang Business Documents Generator.", name: "forms", url: "https://github.com/spawnproc/forms"}],
      "Miscellaneous" => [%{desc: "Library for parsing US Addresses into their individual parts.", name: "address_us", url: "https://github.com/smashedtoatoms/address_us"}, ...]}
  """

  def parse_file(list) do
    list
    |> fetch_repo(%{})
    |> Enum.map(&prepare_lib/1)
    |> Enum.into(%{})
  end
  
  @doc """
    Takes Map and returns Tuple like: %{Key, [%{name: name, url: url, desc: description},...]}.
  ## Example 
      iex> H4cc.Parser.prepare_lib({"## Actors", ["* [dflow](https://github.com/dalmatinerdb/dflow) - Pipelined flow processing engine.", "* [exactor](https://github.com/sasa1977/exactor) - Helpers for easier implementation of actors in Elixir."]})
      {"Actors", %{name: "Awesome Elixir by LibHunt", url: "https://elixir.libhunt.com", desc: ""A curated list of awesome Elixir and Erlang packages and resources.}}
  """

  def prepare_lib({k, v}) do
    key = String.slice(k, 3..-1)           # Slice "## "
    value = 
    v
    |> Enum.map(&String.slice(&1, 2..-1))  # Slice "* "
    |> Enum.map(&parse_str(&1, key))
    {key, value}
  end
  
  @doc """
    Takes String and returns Map like: %{name: name, url: url, desc: description}.
  ## Example 
      iex> H4cc.Parser.parse_str("[Awesome Elixir by LibHunt](https://elixir.libhunt.com) - A curated list of awesome Elixir and Erlang packages and resources.")
      %{name: "Awesome Elixir by LibHunt", url: "https://elixir.libhunt.com", desc: ""A curated list of awesome Elixir and Erlang packages and resources.}
  """

  def parse_str(str, key) do
    {str, %H4cc.Lib{folder: key}}
    |> get_name()
    |> get_url()
    |> get_desc()
    |> check_url()
  end

  @doc """
    Takes String and returns name of a library.
  ## Example 
      iex> H4cc.Parser.get_name("[Awesome Elixir by LibHunt](https://elixir.libhunt.com) - A curated list of awesome Elixir and Erlang packages and resources.")
      "Awesome Elixir by LibHunt"
  """

  def get_name({str, lib}) do
    name =
    str
    |> (&Regex.run(~r/\[.+?\]/, &1)).()
    |> List.to_string
    {String.trim_leading(str, name), %{lib | name: String.slice(name, 1..-2)}}
  end
  
  @doc """
    Takes String and returns URL of a library.
  ## Example 
      iex> H4cc.Parser.get_url("[Awesome Elixir by LibHunt](https://elixir.libhunt.com) - A curated list of awesome Elixir and Erlang packages and resources.")
      "https://elixir.libhunt.com"
  """

  def get_url({str, lib}) do
    url =
    str
    |> (&Regex.run(~r/\(.+?\)/, &1)).()
    |> List.to_string
    {String.trim_leading(str, url), %{lib | url: String.slice(url, 1..-2)}}
  end

  @doc """
    Takes String and returns description of a library
  ## Example 
      iex> H4cc.Parser.get_desc("[Awesome Elixir by LibHunt](https://elixir.libhunt.com) - A curated list of awesome Elixir and Erlang packages and resources.", "[Awesome Elixir by LibHunt](https://elixir.libhunt.com) - ")
      "A curated list of awesome Elixir and Erlang packages and resources."
  """

  def get_desc({str, lib}) do
    %{lib | desc: String.trim_leading(str, " - ")}
  end

  @doc """
    Takes Library and checks if URL is a github repository.
  ## Example 
      iex> H4cc.Parser.check_url("[Awesome Elixir by LibHunt](https://elixir.libhunt.com) - A curated list of awesome Elixir and Erlang packages and resources.")
      "https://elixir.libhunt.com"
  """

  def check_url(lib) do
    if String.contains?(lib.url, "https://github.com/") do
      %{lib | is_git: true}
    else
      %{lib | is_git: false}
    end  
  end

  def fetch_repo([_head | []], acc) do
    cond do
      true                           -> acc
    end
  end
  
  def fetch_repo([head | tail], acc) do
    cond do
      String.starts_with?(head,"##") -> fetch_repo(tail, Map.merge(acc, Map.new([{head, []}])), head)
      true                           -> fetch_repo(tail, acc)
    end
  end

  def fetch_repo([head | []], acc, key) do
    cond do
      String.starts_with?(head,"* ") -> Map.update!(acc, key, &Enum.concat(&1,[head]))
      true                           -> acc
    end
  end
  
  def fetch_repo([head | tail], acc, key) do
    cond do
      String.starts_with?(head,"##") -> fetch_repo(tail, Map.merge(acc, Map.new([{head, []}])), head)
      String.starts_with?(head,"* ") -> fetch_repo(tail, Map.update!(acc, key, &Enum.concat(&1,[head])), key)
      true                           -> fetch_repo(tail, acc, key)
    end
  end
end
