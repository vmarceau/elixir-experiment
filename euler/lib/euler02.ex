defmodule Euler02 do
  @moduledoc """
  Problem 2: By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
  """
  def solve do
    fibonacci_sum(1, 2, 2)
  end

  defp fibonacci_sum(a, b, sum) when a + b > 4_000_000 do
    sum
  end

  defp fibonacci_sum(a, b, sum) do
    c = a + b
    sum = if rem(c, 2) == 0, do: sum + c, else: sum
    fibonacci_sum(b, c, sum)
  end
end
