defmodule Prime do
  def primes_up_to(n) do
    for x <- span(2, n), prime?(x), do: x
  end

  def prime?(x) do
    Enum.all?(span(2, x-1), &(rem(x, &1) != 0))
  end

  def span(from, to) when from > to, do: []
  def span(from, to), do: [from | span(from + 1, to)]
end
