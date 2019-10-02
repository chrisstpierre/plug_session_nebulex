defmodule PlugSessionNebulexTest do
  use ExUnit.Case
  doctest PlugSessionNebulex

  setup do
    # Application.get_env()
  end

  test "greets the world" do
    assert PlugSessionNebulex.hello() == :world
  end
end
