defmodule MyList do
  def sum([]), do: 0
  def sum([head|tail]), do: head + sum(tail)

  def map([], _func), do: []
  def map([head|tail], func), do: [func.(head) | map(tail, func)]

  def mapsum(list, func), do: sum(map(list, func))

  def max([head|tail]), do: _max(tail, head)

  defp _max([], acc), do: acc
  defp _max([head | tail], acc) when head > acc, do: _max(tail, head)
  defp _max([head | tail], acc) when head <= acc, do: _max(tail, acc)
end
