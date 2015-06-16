defmodule OrdersCsv do
  def parse(filename) do
    {:ok, orders} = File.open(filename, [:read], fn(file) ->
      headers = IO.read(file, :line) |> parse_headers

      Enum.map IO.stream(file, :line), &(parse_order(&1, headers))
    end)

    orders
  end

  defp parse_headers(line) do
    line
    |> split_columns
    |> Enum.map(&String.to_atom/1)
  end

  defp parse_order(line, headers) do
    order = line
      |> split_columns
      |> convert_types

    Enum.zip headers, order
  end

  defp split_columns(line) do
    line
    |> String.strip
    |> String.split(",")
  end

  defp convert_types([id, ":" <> city, net_amount]) do
    [
      String.to_integer(id),
      String.to_atom(city),
      String.to_float(net_amount)
    ]
  end
end
