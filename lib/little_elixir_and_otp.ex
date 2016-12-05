defmodule LittleElixirAndOtp do
  defmodule MeterToLengthConverter do
    def convert(:inch, meters), do: meters * 39.3701
    def convert(:feet, meters), do: meters * 3.28084
    def convert(:yard, meters), do: meters * 1.09361
  end
end
