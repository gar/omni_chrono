defmodule OmniChrono.Duration do
  defstruct [:unit, :quantity]

  @type duration_unit ::
          :years
          | :months
          | :weeks
          | :days
          | :hours
          | :minutes
          | :seconds

  @spec new(binary()) ::
          %__MODULE__{quantity: integer(), unit: duration_unit()}
          | {:error, {:invalid_duration, binary()}}
          | {:error, {:unknown_duration_unit, binary()}}
  def new(duration_string) do
    with {:ok, {quantity, short_unit}} <- parse_quantity(duration_string),
         {:ok, unit} <- short_unit_to_long(short_unit) do
      %__MODULE__{quantity: quantity, unit: unit}
    end
  end

  defp parse_quantity(duration_string) do
    case Integer.parse(duration_string) do
      {num, rest} ->
        {:ok, {num, rest}}

      :error ->
        {:error, {:invalid_duration, duration_string}}
    end
  end

  @short_units_to_long %{
    "y" => :years,
    "m" => :months,
    "w" => :weeks,
    "d" => :days,
    "h" => :hours,
    "mins" => :minutes,
    "s" => :seconds
  }
  defp short_unit_to_long(duration_unit_string) do
    case Map.fetch(@short_units_to_long, duration_unit_string) do
      {:ok, long_unit_atom} ->
        {:ok, long_unit_atom}

      :error ->
        {:error, {:unknown_duration_unit, duration_unit_string}}
    end
  end
end
