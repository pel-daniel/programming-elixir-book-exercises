defmodule Tax do
  def add_total_to(orders, tax_rates) do
    # Looks like using Dict.put is more common than ++
    Enum.map(orders, &(&1 ++ [total_amount: total_amount(&1, tax_rates)]))
  end

  # Using pattern matching to destructure the KeywordList would make this cleaner
  # Like the solution of DaveThomas
  defp total_amount(order, tax_rates) do
    tax_rate = Keyword.get(tax_rates, order[:ship_to], 0)

    order[:net_amount] * (1 + tax_rate)
  end
end

defmodule DaveThomasTax do
  def orders_with_total(orders, tax_rates) do
    orders |> Enum.map(&(add_total_to(&1, tax_rates)))
  end

  def add_total_to(order = [id: _, ship_to: state, net_amount: net], tax_rates) do
    tax_rate = Keyword.get(tax_rates, state, 0)
    tax      = net * tax_rate
    total    = net + tax

    Keyword.put(order, :total_amount, total)
  end
end
