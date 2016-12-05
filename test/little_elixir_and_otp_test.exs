defmodule LittleElixirAndOtpTest do
  defmodule MeterToLengthConverterTest do
    use ExUnit.Case

    test "converts one meter to feet properly" do
      assert LittleElixirAndOtp.MeterToLengthConverter.convert(:feet, 1) == 3.28084
    end

    test "converts one meter to inches properly" do
      assert LittleElixirAndOtp.MeterToLengthConverter.convert(:inch, 1) == 39.3701
    end

    test "converts one meter to yards properly" do
      assert LittleElixirAndOtp.MeterToLengthConverter.convert(:yard, 1) == 1.09361
    end
  end
end
