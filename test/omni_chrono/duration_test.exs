defmodule OmniChrono.DurationTest do
  use ExUnit.Case, async: true

  alias OmniChrono.Duration

  for {short_unit_string, long_unit_atom} <- %{
        "y" => :years,
        "m" => :months,
        "w" => :weeks,
        "d" => :days,
        "h" => :hours,
        "mins" => :minutes,
        "s" => :seconds
      } do
    test "new/1 parses #{long_unit_atom} strings into a new duration" do
      assert %Duration{unit: unquote(long_unit_atom), quantity: 5} ==
               Duration.new("5" <> unquote(short_unit_string))
    end
  end

  test "new/1 returns an error if duration string can't be parsed as number and quantity" do
    assert {:error, {:invalid_duration, "fivew"}} == Duration.new("fivew")
  end

  test "new/1 returns an error if unit is not recognised" do
    assert {:error, {:unknown_duration_unit, "eons"}} == Duration.new("10eons")
  end
end
