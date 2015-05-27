defmodule Chop do
  def guess(number, range = bottom..top) do
    _guess(number, range, _new_guess(bottom, top))
  end

  def _guess(number, _, number), do: IO.puts(number)

  def _guess(number, _..top, current) when number > current do
    IO.puts(_format_output(current))
    _guess(number, current..top, _new_guess(current, top))
  end

  def _guess(number, bottom.._, current) when number < current do
    IO.puts(_format_output(current))
    _guess(number, bottom..current, _new_guess(bottom, current))
  end

  def _new_guess(bottom, top), do: div(top + bottom, 2)
  def _format_output(number), do: "Is it #{number}"
end
