defmodule Euler05 do
  @moduledoc """
  Problem 4: What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
  This solution is ugly... There's a much more clever way to solve this but I'm too lazy to optimize and that's not the point here...
  """
  @spec solve :: number
  def solve do
    find(19 * 20)
  end

  def find(n) do
    if Enum.reduce_while(1..18, true, fn x, acc ->
         if rem(n, x) == 0, do: {:cont, acc}, else: {:halt, false}
       end),
       do: n,
       else: find(n + 19 * 20)
  end
end
