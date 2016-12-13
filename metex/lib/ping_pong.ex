defmodule Metex.PingPong do
  def start do
    ping_pid = spawn(__MODULE__, :ping, [])
    pong_pid = spawn(__MODULE__, :pong, [])
    send ping_pid, {pong_pid, :ping}
  end

  def ping do
    receive do
      {from, :ping} ->
        IO.puts "got a ping"
        send from, {self, :pong}
    end
    ping
  end

  def pong do
    receive do
      {from, :pong} ->
        IO.puts "got a pong"
        send from, {self, :ping}
    end
    pong
  end
end
