defmodule RaiseError do
  def ok!({:ok, data}), do: data
  def ok!({_, error}),  do: "Error: #{inspect error}"
end
