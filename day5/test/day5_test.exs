defmodule Day5Test do
  use ExUnit.Case
  doctest Day5

  # Should pass only for part 1 when >= 3 check is disabled
  test "steps_to_exit [0, 3, 0, 1, -3] returns 5" do
    assert Day5.steps_to_exit([0, 3, 0, 1, -3]) == 5
  end

  # Should pass only for part 2 when >= 3 check is enabled
  test "steps_to_exit [0, 3, 0, 1, -3] returns 10" do
    assert Day5.steps_to_exit([0, 3, 0, 1, -3]) == 5
  end
end
