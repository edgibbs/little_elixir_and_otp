defmodule LittleElixirAndOtp do
  defmodule MeterToLengthConverter do
    def convert(:inch, meters) when is_number(meters) and meters >= 0, do: meters * 39.3701
    def convert(:feet, meters) when is_number(meters) and meters >= 0, do: meters * 3.28084
    def convert(:yard, meters) when is_number(meters) and meters >= 0, do: meters * 1.09361
  end

  defmodule Calculations do
    def sum(list) do
      case list do
        [] -> 0
        [head | tail] -> head + sum(tail)
      end
    end
  end
end
