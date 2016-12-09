defmodule LittleElixirAndOtpTest do
  defmodule MeterToLengthConverterTest do
    use ExUnit.Case

    test "converts one meter to feet properly" do
      assert LittleElixirAndOtp.MeterToLengthConverter.convert(:feet, 1) == 3.28084
    end

    test "converts one meter to inches properly and only with numbers" do
      assert LittleElixirAndOtp.MeterToLengthConverter.convert(:inch, 1) == 39.3701
    end

    test "converts one meter to yards properly and only with numbers" do
      assert LittleElixirAndOtp.MeterToLengthConverter.convert(:yard, 1) == 1.09361
    end

    test "fails to convert non-number" do
      assert_raise FunctionClauseError, fn ->
        LittleElixirAndOtp.MeterToLengthConverter.convert(:feet, "smelly")
      end
      assert_raise FunctionClauseError, fn ->
        LittleElixirAndOtp.MeterToLengthConverter.convert(:inch, "smelly")
      end
      assert_raise FunctionClauseError, fn ->
        LittleElixirAndOtp.MeterToLengthConverter.convert(:yard, "smelly")
      end
    end

    test "fails to convert negative numbers" do
      assert_raise FunctionClauseError, fn ->
        LittleElixirAndOtp.MeterToLengthConverter.convert(:feet, -1)
      end
      assert_raise FunctionClauseError, fn ->
        LittleElixirAndOtp.MeterToLengthConverter.convert(:inch, -2)
      end
      assert_raise FunctionClauseError, fn ->
        LittleElixirAndOtp.MeterToLengthConverter.convert(:yard, -3)
      end
    end
  end

  defmodule CalculationsTest do
    use ExUnit.Case

    test "sums a list" do
      assert LittleElixirAndOtp.Calculations.sum([1,2,3]) == 6
    end
  end
end
