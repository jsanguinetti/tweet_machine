defmodule TweetMachineTest do
  use ExUnit.Case
  doctest TweetMachine

  test "greets the world" do
    assert TweetMachine.hello() == :world
  end
end
