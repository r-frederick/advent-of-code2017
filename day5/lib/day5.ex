defmodule Day5 do
  @moduledoc """
  Documentation for Day5.
  """
  require IEx

  def solve(input) do
    file_to_list(input)
      |> steps_to_exit
  end

  def file_to_list(input) do
    File.stream!(input)
      |> Stream.map(&String.replace &1, "\n", "")
      |> Stream.map(&String.to_integer/1)
      |> Enum.to_list
  end

  def steps_to_exit(input_list) do
    Enum.with_index(input_list)
      |> Map.new(fn {x, y} -> {y, x} end)
      |> step({0, 0})
  end

  def step(map, {dest, steps}) do
    {new_dest, new_map} = Map.get_and_update(map, dest, &nil_safe_update/1)
    case new_dest do
      nil -> steps
      _   -> step(new_map, {dest + new_dest, steps + 1})
    end
  end

  def nil_safe_update(input) when input == nil, do: {nil, 0}
  def nil_safe_update(input) when input >= 3, do: {input, input - 1} # Remove this line to solve for Part 1
  def nil_safe_update(input), do: {input, input + 1}
end
