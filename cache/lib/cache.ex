defmodule Cache do
  use GenServer

  ## Client API

  def write(pid, key, value) do
    IO.puts "what"
    GenServer.cast(pid, {:write, key, value})
  end

  def read(pid, key) do
    GenServer.call(pid, {:read, key})
  end

  ## Server callbacks
  def start_link do
    GenServer.start_link(__MODULE__, :ok, [])
  end

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_cast({:write, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  def handle_call({:read, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end
end
