defmodule ColoniesTest do
  use ExUnit.Case
  doctest Colonies

  test "greets the world" do
    assert Colonies.hello() == :world
  end
end
