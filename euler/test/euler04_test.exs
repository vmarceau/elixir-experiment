defmodule Euler04Test do
  use ExUnit.Case
  doctest Euler04

  test "when solve then return correct solution" do
    assert Euler04.solve() == 906_609
  end
end
