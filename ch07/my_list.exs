defmodule MyList do
  def sum([]), do: 0
  def sum([head|tail]), do: head + sum(tail)

  def map([], _func), do: []
  def map([head|tail], func), do: [func.(head) | map(tail, func)]

  def mapsum(list, func), do: sum(map(list, func))
end
