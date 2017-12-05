defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  test "sum of 1122 produces 3" do 
    assert Day1.sum(1122) == 3
  end

  test "sum of 1111 produces 4" do
    assert Day1.sum(1111) == 4
  end

  test "sum of 1234 produces 0" do
    assert Day1.sum(1234) == 0
  end

  test "sum of 91212129 produces 9" do
    assert Day1.sum(91212129) == 9
  end

  test "halfway sum of 1212 produces 6" do
    assert Day1.halfway_sum(1212) == 6
  end

  test "halfway sum of 1221 produces 0" do
    assert Day1.halfway_sum(1221) == 0
  end

  test "halfway sum of 123425 produces 4" do
    assert Day1.halfway_sum(123425) == 4
  end

  test "halfway sum of 123123 produces 12" do
    assert Day1.halfway_sum(123123) == 12
  end

  test "halfway sum of 12131415 produces 4" do
    assert Day1.halfway_sum(12131415) == 4
  end
end
