defmodule Euler02Test do
  use ExUnit.Case
  doctest Euler02

  test "when solve then return correct solution" do
    assert Euler02.solve() == 4_613_732
  end
end
