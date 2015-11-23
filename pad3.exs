defmodule FbFirst do

  def upto(n) when n > 0, do: _upto(1, n, [])

  defp _upto(_current, 0, result), do: Enum.reverse result

  defp _upto(current, left, result) do
    next_answer = cond do
        rem(current, 3) == 0 and rem(current, 5) == 0 -> "FizzBuzz"
        rem(current, 3) == 0 -> "Fizz"
        rem(current, 5) == 0 -> "Buzz"
        true -> current
      end
    _upto(current + 1, left - 1, [ next_answer | result])
  end

end

defmodule FbSecond do

  def upto(n) when n > 0, do: _downto(n, [])

  defp _downto(0, result), do: result

  defp _downto(current, result) do
    next_answer = cond do
        rem(current, 3) == 0 and rem(current, 5) == 0 -> "FizzBuzz"
        rem(current, 3) == 0 -> "Fizz"
        rem(current, 5) == 0 -> "Buzz"
        true -> current
      end
    _downto(current - 1, [ next_answer | result])
  end

end

defmodule FbThird do

  def upto(n) when n > 0 do
    1..n |> Enum.map(&fizzbuzz/1)
  end

  defp fizzbuzz(n) do
    cond do
        rem(n, 3) == 0 and rem(n, 5) == 0 -> "FizzBuzz"
        rem(n, 3) == 0 -> "Fizz"
        rem(n, 5) == 0 -> "Buzz"
        true -> n
    end
  end

end

defmodule FizzBuzz do
  def upto(n) when n > 0, do: 1..n |> Enum.map(&fizzbuzz/1)

  defp fizzbuzz(n) when rem(n,3) == 0 and rem(n,5) == 0, do: "FizzBuzz"
  defp fizzbuzz(n) when rem(n,3) == 0, do: "Fizz"
  defp fizzbuzz(n) when rem(n,5) == 0, do: "Buzz"
  defp fizzbuzz(n), do: n
end

defmodule Bouncer do
  def check(person \\ %{name: "Dave", age: 27}) do
    case person do
      stats = %{age: age} when is_number(age) and age >= 21 -> IO.puts "You are cleared to enter the Foo Bar, #{stats.name}"
      _ -> IO.puts "Sorry, no admission"
    end
  end

end