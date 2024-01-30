defmodule OmniChrono.DurationTest do
  use ExUnit.Case

  alias OmniChrono.Duration

  test "new/1 parses a year string into a new duration" do
    assert %Duration{unit: :years, quantity: 5} = Duration.new("5y")
  end
end
