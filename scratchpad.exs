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
    _low .. high = range
    new_range = attempt .. high
    guess(actual, new_range)
  end
  def guess(actual, range, attempt) when attempt > actual do
    IO.puts "Lower than #{attempt}."
    low .. _high = range
    new_range = low .. attempt
    guess(actual, new_range)
  end
  def guess(_actual, _range, attempt) do
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

#From page 59, Exercise: ModulesAndFunctions-7
defmodule ModFunc7 do
  def fl_to_st(number \\ 5.78394) do
    :io.format("~.3f", [number])
  end
  def get_os(value \\ "HOME") do
    System.get_env(value)
  end
  def extension(file_path \\ "intro/scratchpad.exs") do
    Path.extname(file_path)
  end
  def current_dir, do: System.cwd
end

#From page 62+. Method to determine length of list.
defmodule MyList do
  def len([]), do: 0
  def len([_head|tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head|tail]), do: [head*head|square(tail)]

  def add_1([]), do: []
  def add_1([head|tail]), do: [head+1|add_1(tail)]

  def map([], _func), do: []
  def map([head|tail], func), do: [func.(head)|map(tail,func)]

  def sum(list), do: _sum(list,0)

  # private methods
  defp _sum([], total), do: total
  defp _sum([head|tail], total), do: _sum(tail, head+total)
end

#From page 68, Exercise ListsAndRecursion-0
defmodule LaR0 do
  def sum([]), do: 0
  def sum([head|tail]), do: head + sum(tail)
end