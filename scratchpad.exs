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

  def reduce([], value, _), do: value
  def reduce([head|tail], value, func), do: reduce(tail, func.(head,value), func)

  def swap([]), do: []
  def swap([a,b|tail]), do: [b,a|swap(tail)]
  def swap([_]), do: raise "Can't swap a list with an odd number of elements."

  # private methods
  defp _sum([], total), do: total
  defp _sum([head|tail], total), do: _sum(tail, head+total)
end

#From page 68, Exercise ListsAndRecursion-0
defmodule LaR0 do
  def sum([]), do: 0
  def sum([head|tail]), do: head + sum(tail)
end

#From page 69, Exercise: ListsAndRecursion-1
defmodule LaR1 do
  def mapsum(list, func), do: _mapsum(list, func, 0)

  #private methods
  defp _mapsum([], _, total), do: total
  defp _mapsum([head|tail], func, total), do: _mapsum(tail, func, func.(head) + total)
end

#From page 69, Exercise: ListsAndRecursion-2
defmodule LaR2 do
  def maxlist(list), do: _maxlist(list, List.first(list))

  #private methods
  defp _maxlist([], answer), do: answer
  defp _maxlist([head|tail], answer) when head > answer do
    _maxlist(tail, head)
  end
  defp _maxlist([head|tail], answer) when head <= answer do
    _maxlist(tail, answer)
  end
end

defmodule WeatherHistory do
  def for_location([], _), do: []
  # head = [_, _, _, _]
  def for_location([ head = [_, target_loc, _, _] | tail], target_loc) do
    [ head | for_location(tail, target_loc) ]
  end
  def for_location([_|tail], target_loc), do: for_location(tail, target_loc)

  def for_location_27([]), do: []
  def for_location_27([[time, 27, temp, rain]|tail]) do
    [[time,27,temp,rain] | for_location_27(tail)]
  end
  def for_location_27([_|tail]), do: for_location_27(tail)

  def test_data do
    [
       [1366225622, 26, 15, 0.125],
       [1366225622, 27, 15, 0.45],
       [1366225622, 28, 21, 0.25],
       [1366229222, 26, 19, 0.081],
       [1366229222, 27, 17, 0.468],
       [1366229222, 28, 15, 0.60],
       [1366232822, 26, 22, 0.095],
       [1366232822, 27, 21, 0.05],
       [1366232822, 28, 24, 0.03],
       [1366236422, 26, 17, 0.025]
    ]
  end
end

# Page 72, Exercise: ListsAndRecursion-4
defmodule LaR4 do
  def span(from, to), do: _span(from, to, [])

  # Private methods
  defp _span(from, to, list)
    when from <= to,
    do: _span(from + 1, to, [from | list])
  defp _span(from, to, list)
    when from > to,
    do: list
end

defmodule MyDict do
  def values(dict) do
    dict |> Dict.values |> Enum.sum
  end

  # Test data
  def people do
    [
      %{ name: "Grumpy", height: 1.24 },
      %{ name: "Dave", height: 1.88 },
      %{ name: "Dopey", height: 1.32 },
      %{ name: "Shaquille", height: 2.16 },
      %{ name: "Sneezy", height: 1.28 }
    ]
  end

  def book(%{name: name, height: height})
    when height > 1.9,
    do: IO.puts "Need extra long bed for #{name}"
  def book(%{name: name, height: height})
    when height < 1.3,
    do: IO.puts "Need low shower controls for #{name}"
  def book(person), do: IO.puts "Need regular bed for #{person.name}"
end

defmodule Subscriber do
  defstruct name: "", paid: false, over_18: true

  def may_attend_after_party(subscriber = %Subscriber{}) do
    subscriber.paid && subscriber.over_18
  end

  def print_vip_badge(%Subscriber{name: name})
    when name != "",
    do: IO.puts "Very cheap badge for #{name}"

  def print_vip_badge(%Subscriber{}), do: raise "missing name for badge"
end

defmodule Attendee do
  @derive Access
  defstruct name: "", over_18: false
end

defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct owner: %{}, details: "", severity: 1
end

defmodule Test do
  def authors do
    [
      %{name: "Jose", language: "Elixir"},
      %{name: "Matz", language: "Ruby"},
      %{name: "Larry", language: "Perl"}
    ]
  end
end

# Page 93, Exercise: ListsAndRecursion-5 (partial)
defmodule LaR5 do
  def all(list, func), do: _all(list, func, true)

  def filter(list, func), do: _filter(list, func, [])


  # Private methods
  defp _all(_, _, false), do: false
  defp _all([], _, true), do: true
  defp _all([head|tail], func, _), do: _all(tail, func, func.(head))

  defp _filter([], _, list), do: Enum.reverse(list)
  defp _filter([head|tail], func, list) do
    if func.(head) do
      _filter(tail, func, [head|list])
    else
      _filter(tail, func, list)
    end
  end
end

# Page 93, Exercise: ListsAndRecursion-6 (partial - probably doesn't need defps?)
defmodule LaR6 do
  def flatten(list), do: _flatten(list,[])

  # Private methods
  defp _flatten([], result), do: Enum.reverse(result)
  defp _flatten([head|[]], result), do: [head|result]
  defp _flatten([head|tail], result), do: _flatten(tail, _flatten(head, result))
  defp _flatten(head, _), do: head
end

# Page 97, Stream.unfold
defmodule Fib do
  def seq(num \\ 15) do
    # Creates a collection from resulting tupla. { num_added_to_collection,
    # { tupla_passed_back_to_unfold_function } }
    Stream.unfold({0, 1}, fn {f1, f2} -> {f1, {f2, f1 + f2}} end)
      |> Enum.take(num)
  end
end