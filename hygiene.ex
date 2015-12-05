defmodule Scope do
  defmacro update_local(val) do
    local = "some value"
    result = quote do
      local = unquote(val)
      IO.puts "End of macro body, local = #{local}"
    end
    IO.puts "In macro definition, local = #{local}"
    result
  end
end

defmodule Test do
  require Scope

  local = 123
  Scope.update_local("cat")
  IO.puts "On return, local = #{local}"
end

# Here’s the result of running that code:
#
#   In macro definition, local = some value
#   End of macro body, local = cat
#   On return, local = 123
#
# If the macro body was just substituted in at the point of call, both it
# and the module Test would share the same scope, and the macro would overwrite
# the variable local, so we’d see:
#
#   In macro definition, local = some value
#   End of macro body, local = cat
#   On return, local = cat