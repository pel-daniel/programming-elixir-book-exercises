list_concat = &(&1 ++ &2)
sum = &(&1 + &2 + &3)
pair_tuple_to_list = fn { a, b } -> [a, b] end

IO.inspect list_concat.([:a, :b], [:c, :d])
IO.inspect sum.(1, 2, 3)
IO.inspect pair_tuple_to_list.({1234, 5678})
