defmodule ServalTest do
  use ExUnit.Case
  doctest Serval

  test "greets the world" do
    assert Serval.hello() == :world
  end
end
