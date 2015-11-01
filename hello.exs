# This is my scratchpad for going through Programming Elixir
IO.puts "From page 35, Exercise: Functions-1"
list_concat = fn([q,p],[x,y]) -> [q,p] ++ [x,y] end
IO.puts (inspect list_concat.([:a,:b],[:c,:d]))

sum = fn(x,y,z) -> x + y + z end
IO.puts (inspect sum.(1,2,3))

pair_tuple_to_list = fn({x,y}) -> [x,y] end
IO.puts (inspect pair_tuple_to_list.({1234, 5678}))

IO.puts "From page 36, Working with Larger Code Examples"
handle_open = fn
  {:ok, file} -> "First Line: #{IO.read(file, :line)}"
  {_, error}  -> "Error: #{:file.format_error(error)}"
end

IO.puts handle_open.(File.open("hello.exs"))
IO.puts handle_open.(File.open("nonexistent"))

IO.puts "From page 37, Exercise: Functions-2"
is_buzz = fn
  (0,0,_) -> "FizzBuzz"
  (0,_,_) -> "Fizz"
  (_,0,_) -> "Buzz"
  (_,_,x) -> x
end

IO.puts (inspect is_buzz.(0,0,"Hi"))
IO.puts (inspect is_buzz.(0,1,"Hi"))
IO.puts (inspect is_buzz.(1,0,"Hi"))
IO.puts (inspect is_buzz.(1,1,"Hi"))

IO.puts "From page 37, Exercise: Functions-3"
more_buzz = fn(n) -> is_buzz.(rem(n,3), rem(n,5), n) end
IO.puts (inspect more_buzz.(10))
IO.puts (inspect more_buzz.(11))
IO.puts (inspect more_buzz.(12))
IO.puts (inspect more_buzz.(13))
IO.puts (inspect more_buzz.(14))
IO.puts (inspect more_buzz.(15))
IO.puts (inspect more_buzz.(16))

IO.puts "From page 39, Exiercise: Functions-4"
prefix = fn first -> (fn second -> "#{first} #{second}" end) end
mrs = prefix.("Mrs")
IO.puts mrs.("Smith")
IO.puts prefix.("Elixir").("Rocks")

IO.puts "From page 40"
list = [1,3,5,7,9]
IO.puts (inspect Enum.map list, fn elem -> elem * 2 end)
IO.puts (inspect Enum.map list, fn elem -> elem * elem end)