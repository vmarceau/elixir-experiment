defmodule Euler05Test do
  use ExUnit.Case
  doctest Euler05

  test "when solve then return correct solution" do
    assert Euler05.solve() == 232_792_560
  end
end
