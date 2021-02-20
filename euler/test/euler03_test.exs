defmodule Euler03Test do
  use ExUnit.Case
  doctest Euler03

  test "when solve then return correct solution" do
    assert Euler03.solve() == 6857
  end
end
