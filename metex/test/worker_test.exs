defmodule Metex.WorkerTest do
  use ExUnit.Case

  test "returns degrees celcius for a given place" do
    assert Metex.Worker.temperature_of("Sacramento, CA") == "Sacramento, CA: 18.4°C"
  end

  test "returns error if unknown town" do
    assert Metex.Worker.temperature_of("Zzyyxx, CA") == "Zzyyxx, CA not found"
  end
end
