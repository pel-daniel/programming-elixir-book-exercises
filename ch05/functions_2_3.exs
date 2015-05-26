f2 = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, n) -> n
end

IO.inspect f2.(0, 0, 0)
IO.inspect f2.(0, 1, 2)
IO.inspect f2.(1, 0, 3)
IO.inspect f2.(1, 2, 3)

fizzbuzz = fn n -> f2.(rem(n, 3), rem(n, 5), n) end

Enum.each 10..16, &(IO.inspect fizzbuzz.(&1))
