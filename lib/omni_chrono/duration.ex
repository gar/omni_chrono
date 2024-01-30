defmodule OmniChrono.Duration do
  defstruct [:unit, :quantity]

  def new(duration_string) do
    with {:ok, {quantity, short_unit}} = parse_quantity(duration_string),
      {:ok, unit} <- short_unit_to_long(short_unit) do
      %__MODULE__{quantity: quantity, unit: unit}
    end
  end

  defp parse_quantity(duration_string) do
    case Integer.parse(duration_string) do
      {num, rest} ->
        {:ok, {num, rest}}

      :error ->
        {:error, {:invalid_duration_string, duration_string}}
    end
  end

  defp short_unit_to_long("y") do
    {:ok, :years}
  end

  defp short_unit_to_long(other) do
   {:error, {:unknown_duration_unit, other}}
  end
end
