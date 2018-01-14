defmodule H4ccTest do
  use ExUnit.Case
  doctest H4cc

  test "greets the world" do
    assert H4cc.hello() == :world
  end
end
