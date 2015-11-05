defmodule Factorial do
  def of(0), do: 1
  def of(n) when n > 0 do
    n * of(n-1)
  end
end

#From page 47, Exercise: ModulesAndFunctions-4
defmodule Sum do
  def of(0), do: 0
  def of(n) when n > 0 do
    n + of(n-1)
  end
end

#From page 47, Exercise: ModulesAndFunctions-5
defmodule Gcd do
  def of(x,0), do: x
  def of(x,y), do: of(y,rem(x,y))
end