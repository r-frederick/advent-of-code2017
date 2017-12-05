defmodule Day2 do
  @moduledoc """
  Documentation for Day2.
  """

  @doc """
    Returns the difference between the highest and lowest values of a given line
  """
  def line_difference(line) do
    String.split(line)
      |> Enum.map(&String.to_integer/1) 
      |> Enum.min_max 
      |> (fn({first, second})-> second - first end).()
  end

  def file_difference_sum(file) do
    File.stream!(file)
      |> Stream.map(&line_difference/1)
      |> Enum.sum
  end

  def file_divides_whole(file) do
    File.stream!(file)
      |> Stream.map(&filter_divisible_value/1)
      |> Enum.sum
  end

  # Enum.find(test_case, &Enum.find(test_case, fn(x) -> Day2.divides_whole? x, &1 end))
  def filter_divisible_value(line) do
    split = String.split(line) |> Enum.map(&String.to_integer/1)

    split
      |> Enum.filter(&Enum.find(split, fn(x) -> divides_whole? x, &1 end))
      |> Enum.min_max
      |> (fn({first, second})-> div second, first end).()
  end

  def divides_whole?(a, b) do
    c = div(a, b)
    d = div(b, a)
    (c * b == a || a * d == b) && a != b
  end
end
