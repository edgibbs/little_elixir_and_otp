defmodule Cache do
  use GenServer

  ## Client API

  def start_link do
    GenServer.start_link(__MODULE__, %{}, name: :cache_worker)
  end

  def write(key, value) do
    GenServer.cast(:cache_worker, {:write, key, value})
  end

  def read(key) do
    GenServer.call(:cache_worker, {:read, key})
  end

  def delete(key) do
    GenServer.cast(:cache_worker, {:delete, key})
  end

  ## Server callbacks

  def handle_cast({:write, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  def handle_cast({:delete, key}, state) do
    {:noreply, Map.delete(state, key)}
  end

  def handle_call({:read, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end
end
