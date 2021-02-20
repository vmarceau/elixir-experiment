defmodule Euler05 do
  @moduledoc """
  Problem 5: What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
  This solution is not optimal, but I'm too lazy to optimize...
  """
  @spec solve :: number
  def solve do
    step = 1..20 |> Enum.filter(&prime?(&1)) |> Enum.reduce(1, &(&1 * &2))
    find(step, step)
  end

  defp find(n, step) do
    if Enum.reduce_while(1..20, true, fn x, acc ->
         if rem(n, x) == 0, do: {:cont, acc}, else: {:halt, false}
       end),
       do: n,
       else: find(n + step, step)
  end

  defp prime?(n) when n in [2, 3], do: true

  defp prime?(n) do
    max = div(n, 2)

    Enum.reduce_while(2..max, true, fn x, acc ->
      if rem(n, x) == 0, do: {:halt, false}, else: {:cont, acc}
    end)
  end
end
