defmodule H4cc.Parser do
  require Logger

  def parsefile(list) do
    list
    |> fetch_repo(%{})
    |> Enum.map(&prepare_lib/1)
    |> Enum.into(%{})
  end

  def prepare_lib({key, value}) do
    pr_key = String.slice(key, 3..-1)
    pr_value = prepare_lib_repo(value)
    {pr_key, pr_value}
  end

  def prepare_lib_repo(list) do
    list
    |> Enum.map(&String.slice(&1, 2..-1))
    |> Enum.map(&parse_str/1)
  end

  def parse_str(str) do
    name = Regex.run(~r/\[.+?\]/, str)
    url = Regex.run(~r/\(.+?\)/, str)
    desc = String.trim_leading(str, Enum.join([name, url], ""))
    name++url++desc
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
