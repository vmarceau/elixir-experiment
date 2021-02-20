defmodule Euler01 do
  @moduledoc """
  Problem 1: Find the sum of all the multiples of 3 or 5 below 1000.
  """
  def solve do
    0..999 |> Enum.filter(&(rem(&1, 3) == 0 || rem(&1, 5) == 0)) |> Enum.sum()
  end
end
