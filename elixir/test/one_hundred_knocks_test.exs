defmodule OneHundredKnocksTest do
  use ExUnit.Case
  doctest OneHundredKnocks

  test "greets the world" do
    assert OneHundredKnocks.hello() == :world
  end
end
