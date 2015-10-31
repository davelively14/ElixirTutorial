IO.puts "Hello, World!"

list_concat = fn([q,p],[x,y]) -> [q,p] ++ [x,y] end

IO.puts (inspect list_concat.([:a,:b],[:c,:d]))