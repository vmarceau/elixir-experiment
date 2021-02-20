defmodule Euler03 do
  @moduledoc """
  Problem 3: What is the largest prime factor of the number 600851475143 ?
  """
  def solve do
    n = 600_851_475_143
    m = :math.sqrt(n) |> floor()

    1..m
    |> Enum.reduce([], fn
      x, acc when rem(n, x) == 0 -> acc ++ [x, div(n, x)]
      _, acc -> acc
    end)
    |> Enum.filter(&prime?(&1))
    |> Enum.max()
  end

  defp prime?(n) when n in [2, 3], do: true

  defp prime?(n) do
    max = div(n, 2)

    Enum.reduce_while(2..max, true, fn x, acc ->
      if rem(n, x) == 0, do: {:halt, false}, else: {:cont, acc}
    end)
  end
end
