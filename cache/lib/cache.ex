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

  def clear do
    GenServer.cast(:cache_worker, :clear)
  end

  ## Server callbacks

  def handle_cast({:write, key, value}, cache) do
    {:noreply, Map.put(cache, key, value)}
  end

  def handle_cast({:delete, key}, cache) do
    {:noreply, Map.delete(cache, key)}
  end

  def handle_cast(:clear, _cache) do
    {:noreply, %{}}
  end

  def handle_call({:read, key}, _from, cache) do
    {:reply, Map.get(cache, key), cache}
  end
end
