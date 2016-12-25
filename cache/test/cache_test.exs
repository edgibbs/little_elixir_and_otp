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

  test "can clear all cache items" do
    Cache.start_link
    Cache.write(:a, "A")
    Cache.write(:b, "B")
    Cache.write(:c, "C")
    Cache.clear
    assert Cache.read(:a) == nil
    assert Cache.read(:b) == nil
    assert Cache.read(:c) == nil
  end

  test "can check for existence" do
    Cache.start_link
    assert Cache.exist?(:real_key) == false
    Cache.write(:real_key, "real key")
    assert Cache.exist?(:real_key) == true
  end
end
