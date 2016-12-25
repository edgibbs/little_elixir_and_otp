defmodule CacheTest do
  use ExUnit.Case, async: true

  test "can get a value for a stored cache item" do
    {:ok, pid} = Cache.start_link
    Cache.write(pid, :stooges, ["Larry", "Curly", "Moe"])
    assert Cache.read(pid, :stooges) == ["Larry", "Curly", "Moe"]
  end
end
