defmodule Euler04 do
  @moduledoc """
  Problem 4: Find the largest palindrome made from the product of two 3-digit numbers.

  """
  @spec solve :: number
  def solve do
    Enum.reduce(100..999, 0, fn x, acc ->
      p =
        Enum.reduce(x..999, 0, fn y, acc ->
          if palindrome?("#{x * y}") && x * y > acc, do: x * y, else: acc
        end)

      if p > acc, do: p, else: acc
    end)
  end

  @spec palindrome?(String.t()) :: boolean
  def palindrome?(s) do
    Enum.reduce_while(0..div(String.length(s), 2), true, fn x, acc ->
      if String.at(s, x) == String.at(s, String.length(s) - x - 1),
        do: {:cont, acc},
        else: {:halt, false}
    end)
  end
end
