defmodule CacheTest do
  use ExUnit.Case, async: true

  test "can get a value for a stored cache item" do
    Cache.start_link
    Cache.write(:stooges, ["Larry", "Curly", "Moe"])
    assert Cache.read(:stooges) == ["Larry", "Curly", "Moe"]
  end

  test "can delete a cache item" do
    Cache.start_link
    Cache.write(:stooges, ["Larry", "Curly", "Moe"])
    assert Cache.read(:stooges) == ["Larry", "Curly", "Moe"]
    Cache.delete(:stooges)
    assert Cache.read(:stooges) == nil
  end
end
