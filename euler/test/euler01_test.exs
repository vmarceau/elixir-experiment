defmodule Euler01Test do
  use ExUnit.Case
  doctest Euler01

  test "when solve then return correct solution" do
    assert Euler01.solve() == 233_168
  end
end
