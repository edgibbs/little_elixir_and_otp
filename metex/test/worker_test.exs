defmodule Metex.WorkerTest do
  use ExUnit.Case, async: true

  test "returns degrees celcius for a given place" do
    assert Metex.Worker.temperature_of("Sacramento, CA") == "Sacramento, CA: 18.4°C"
  end

  test "returns error if unknown town" do
    assert Metex.Worker.temperature_of("Zzyyxx, CA") == "Zzyyxx, CA not found"
  end

  test "can use multiple processes" do
    ["Sacramento", "LA", "Singapore"]
    |> Enum.each(fn city ->
      pid = spawn(Metex.Worker, :loop, [])
      send(pid, {self, city})
    end)

    assert_receive({:ok, "Sacramento: 18.4°C"})
    assert_receive({:ok, "LA: 18.4°C"})
    assert_receive({:ok, "Singapore: 18.4°C"})
  end
end
