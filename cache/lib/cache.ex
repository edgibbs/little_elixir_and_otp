defmodule Cache do
  use GenServer

  ## Client API

  def write(key, value) do
    GenServer.cast(:cache_worker, {:write, key, value})
  end

  def read(key) do
    GenServer.call(:cache_worker, {:read, key})
  end

  def start_link do
    GenServer.start_link(__MODULE__, %{}, name: :cache_worker)
  end

  ## Server callbacks

  def handle_cast({:write, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  def handle_call({:read, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end
end
