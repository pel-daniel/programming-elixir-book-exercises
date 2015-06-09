defmodule MyEnum do
  def all?([], _func), do: true
  def all?([head | tail], func), do: func.(head) and all?(tail, func)

  def each([], _func), do: :ok
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter([], _func), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  def split(ls, n), do: _split(ls, n, [])

  def _split([], _n, acc), do: { Enum.reverse(acc), [] }
  def _split(ls, 0, acc),   do: { Enum.reverse(acc), ls }
  def _split([head | tail], n, acc), do: _split(tail, n-1, [head | acc])

  def take([], _n), do: []
  def take(_, 0),  do: []
  def take([head | tail], n) do
    [head | take(tail, n - 1)]
  end

  def flatten(xs), do: _flatten(xs, [])

  def _flatten([[x | xs] | ys], acc) do
    _flatten([x | (xs ++ ys)], acc)
  end
  def _flatten([x | xs], acc) do
    _flatten(xs, [x | acc])
  end
  def _flatten([], acc) do
    Enum.reverse(acc)
  end
end
