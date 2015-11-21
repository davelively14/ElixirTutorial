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

defmodule Dap do
  def it do
    String.at("Dog", 2) |> String.capitalize
  end
end

# Page 119, Exercise: StringsAndBinaries-5 (incomplete)
defmodule Center do

  def it(strings \\ ["cat", "zebra", "elephant"]) do
    strings
  end

end

defmodule Utf8 do
  def each(str, func) when is_binary(str), do: _each(str, func)

  defp _each(<< head :: utf8, tail :: binary >>, func) do
    func.(head)
    _each(tail, func)
  end

  defp _each(<<>>, _), do: []
end

# Page 120, Exercise: StringsAndBinaries-6
defmodule SaB6 do

  def sentence_case(str) when is_binary(str) do
    String.split(str, ". ")
      |> cap_it
      |> IO.puts
  end

  def cap_it(str), do: _cap_it(str, "")

  defp _cap_it([head|tail], result), do: _cap_it(tail, result <> String.capitalize(head) <> ". ")
  defp _cap_it([], result), do: result

end