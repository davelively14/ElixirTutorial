defmodule Example do
  def func(p1, p2 \\ 123)

  def func(p1, p2) when is_list(p1) do
    "You said #{p2} with a list"
  end

  def func(p1, p2) do
    "You passed in #{p1} and #{p2}"
  end
end

#From page 52, Exercise: ModulesAndFunctions-6
defmodule Chop do
  def guess(actual, range) do
    first .. last = range
    IO.puts(inspect div((last + first),2))
    guess(actual, range, div((last + first),2))
  end
  def guess(actual, range, attempt) when attempt < actual do
    IO.puts "Higher than #{attempt}."
    low .. high = range
    new_range = attempt .. high
    guess(actual, new_range)
  end
  def guess(actual, range, attempt) when attempt > actual do
    IO.puts "Lower than #{attempt}."
    low .. high = range
    new_range = low .. attempt
    guess(actual, new_range)
  end
  def guess(actual, range, attempt) do
    IO.puts "The answer is: #{attempt}"
  end
end