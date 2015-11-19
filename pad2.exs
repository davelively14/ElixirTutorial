# Chapter 11, Strings and Binaries
defmodule Str do
  def it do
    IO.puts "start"
    IO.write """
      my
      string
      """
    IO.puts "end"
  end
end

defmodule Sigils do
  def it do
    IO.puts inspect "C sigil #{~C[1\n2#{1+2}]}"
    IO.puts inspect "c sigil #{~c"1\n2#{1+2}"}"
    IO.puts inspect "S sigil #{~S[1\n2#{1+2}]}"
    IO.puts inspect "s sigil #{~s/1\n2#{1+2}/}"
    IO.puts inspect ~W[the c#{'a'}t sat on the mat]
    IO.puts inspect ~w[the c#{'a'}t sat on the mat]
    # a = atom, c = character list, s = string
    IO.puts inspect ~w[the c#{'a'}t sat on the mat]a
    IO.puts inspect ~w[the c#{'a'}t sat on the mat]c
    IO.puts inspect ~w[the c#{'a'}t sat on the mat]s
  end
end

defmodule ShowNums do
  def it(str \\ 'wombat') do
    :io.format "~w~n", [str]
  end
end

defmodule Parse do

  def number([ ?- | tail ]), do: _number_digits(tail, 0) * -1
  def number([ ?+ | tail ]), do: _number_digits(tail, 0)
  def number(str), do: _number_digits(str, 0)

  defp _number_digits([], value), do: value
  defp _number_digits([digit|tail], value) when digit in '0123456789' do
    _number_digits(tail, value*10 + digit - ?0)
  end
  defp _number_digits([ non_digit | _], _) do
    raise "Invalid digit '#{[non_digit]}'"
  end
end