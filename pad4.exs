defmodule Chain do
  def counter(next_pid) do
    receive do
      n -> send next_pid, n + 1
    end
  end

  def create_processes(n) do
    last = Enum.reduce 1..n, self,
      fn (_, send_to) -> spawn(Chain, :counter, [send_to])
    end

    # start the count by sending
    send last, 0

    # and wait for the result to come back to us
    receive do
      final_answer when is_integer(final_answer) -> "Result is #{inspect(final_answer)}"
    end
  end

  def run(n) do
    IO.puts inspect :timer.tc(Chain, :create_processes, [n])
  end
end

# Exercise: WorkingWithMultipleProcesses-2
defmodule MultiP1 do

  def run(token1, token2) do
    pid1 = spawn(MultiP1, :reply, [])
    pid2 = spawn(MultiP1, :reply, [])
    send pid1, token1
    send pid2, token2
  end

  def reply do
    receive do
      {sender, token} -> send sender, token
    end
  end
end

#Exercise: WorkingWithMultipleProcesses-3
defmodule MultiP3 do
  def end_quick(sender) do
    send sender, "Just a test"
    exit :boom
  end

  def listen_to do
    receive do
      msg -> IO.puts "Message received: #{inspect msg}"
      listen_to
    after 1000 -> IO.puts "No more messages"
    end
  end

  def run do
    spawn_link(MultiP3, :end_quick, [self])
    :timer.sleep(500)
    listen_to
  end
end