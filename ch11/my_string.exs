defmodule MyString do
  def printable_charlist?(xs) do
    printable_chars = ?\s..?~

    Enum.all? xs, &(Enum.member? printable_chars, &1)
    # x in xs is shorter that Enum.member?
  end

  def anagram?(word1, word2) do
    Enum.sort(word1) == Enum.sort(word2)
  end

  def parse(xs) do
    [num1, operator, num2] = to_string(xs) |> String.split

    apply(
      Kernel,
      String.to_atom(operator),
      Enum.map([num1, num2], &String.to_integer/1)
    )
  end
end
