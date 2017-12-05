defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  test "line difference of 5 1 9 5 produces 8" do
    assert Day2.line_difference("5 1 9 5") == 8
  end

  test "line difference of 7 5 3 produces 4" do
    assert Day2.line_difference("7 5 3") == 4
  end

  test "line difference of 2 4 6 8 produces 6" do
    assert Day2.line_difference("2 4 6 8") == 6    
  end

  test "filtered divisible values of 5 9 2 8 produces 4" do
    assert Day2.filter_divisible_value("5 9 2 8") == 4
  end

  test "filtered divisible values of 9 4 7 3 produces 3" do
    assert Day2.filter_divisible_value("9 4 7 3") == 3
  end

  test "filtered divisible values of 3 8 6 5 produces 2" do
    assert Day2.filter_divisible_value("3 8 6 5") == 2
  end
end
