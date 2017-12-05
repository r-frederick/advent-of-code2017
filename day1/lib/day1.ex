defmodule Day1 do
  @moduledoc """
  Documentation for Day1.
  """

  @doc """
  Finds the sum of all digits that match the next digit in the list.
  The list is circular, so the digit after the last digit is the first digit in the list.
  """
  def sum(captcha) do
    ([head | _] = digits) = Integer.digits(captcha)
    digits ++ [head]
      |> List.foldr({0, 0}, fn(x, acc) -> add_check(x, acc) end)
      |> elem(1)
  end

  
  defp add_check(current, {last, total}) do
    case current do
      ^last -> {current, total + current}
      _     -> {current, total}
    end
  end
  
  def halfway_sum(captcha) do
    digit_list = Integer.digits(captcha)
    list_size  = Enum.count(digit_list)
    offset     = div list_size, 2
    [head | _] = Enum.chunk_every(digit_list, div(list_size, 2))
    aug_list   = digit_list ++ head
    digit_list
      |> List.foldl({0, 0}, fn(x, acc) -> halfway_add_check(x, acc, aug_list, offset) end)
      |> elem(0)
  end
  
  defp halfway_add_check(current, {total, index}, digit_list, offset) do
    halfway_value = Enum.at(digit_list, index + offset)
    case current do
      ^halfway_value -> {total + current, index + 1}
      _              -> {total, index + 1}
    end
  end
end
