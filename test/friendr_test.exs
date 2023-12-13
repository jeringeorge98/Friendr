defmodule FriendrTest do
  use ExUnit.Case
  doctest Friendr

  test "greets the world" do
    assert Friendr.hello() == :world
  end
end
