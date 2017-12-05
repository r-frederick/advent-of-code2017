defmodule Day3Test do
  use ExUnit.Case
  doctest Day3

  test "data from square 1 is carried 0 steps" do
    assert Day3.find_square_dist(1) == 0
  end
  
  test "data from square 12 is carried 3 steps" do
    assert Day3.find_square_dist(12) == 3
  end

  test "data from square 23 is carried 2 steps" do
    assert Day3.find_square_dist(23) == 2
  end

  test "data from square 1024 is carried 31 steps" do
    assert Day3.find_square_dist(1024) == 31
  end
end
