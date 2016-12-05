defmodule LittleElixirAndOtpTest do
  defmodule MeterToFootConverterTest do
    use ExUnit.Case

    test "somthing" do
      assert LittleElixirAndOtp.MeterToFootConverter.convert(1) == 3.28084
    end
  end
end
