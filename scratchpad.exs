defmodule Example do
  @attr "one"
  def first, do: @attr
  @attr "two"
  def second, do: @attr
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

#From page 56. Func1 and Func2 do the same thing.
defmodule ImpEx do
  def func1 do
    List.flatten [1,[2,3],4]
  end
  def func2 do
    import List, only: [flatten: 1]
    flatten [5,[6,7],8]
  end
end