defmodule Day3 do
  @moduledoc """
  Documentation for Day3.
  """

  defmodule Part1 do

    def find_square_dist(square) do
      case square do
        1 -> 0
        _ -> layer = find_square_layer(square)
            dist_index = first_in_layer(layer) |> Kernel.-(square) |> abs()
            layer_dist(layer - 1)
              |> Enum.fetch!(dist_index)
      end
    end

    def layer_adds_from(start \\ 1) do
      Stream.resource(
        fn -> start end,
        fn(num) ->    
          case num do
            1 -> 
              {[1], num + 1}
            _ ->
              {[8 * (num - 1)], num + 1}
          end
        end,
        fn(num) -> num end
      )
    end

    def layer_dist(layer) do
      take_count = layer_adds_from() |> Enum.take(layer + 1) |> Enum.max
      layer_dist_stream(layer)
        |> Enum.take(take_count)
    end

    def layer_dist_stream(layer) do
      {min, max, start} = min_max_start_dist(layer)
      Stream.resource(
        fn -> {start, -1} end,
        fn({num, step}) ->
          case num do
            num when num == min ->
              {[num], {num - step, +1}}
            num when num == max ->
              {[num], {num - step, -1}}
            _ -> {[num], {num + step, step}}
          end
        end,
        fn({num, _}) -> num end
      )
    end

    def find_square_layer(square) do
      Enum.find(1..square, fn(x) -> square < last_in_layer(x) end)
    end

    def first_in_layer(layer) do
      layer_adds_from()
        |> Enum.take(layer - 1)
        |> Enum.sum()
        |> Kernel.+(1)
    end

    def last_in_layer(layer) do
      first_in_layer(layer + 1) - 1
    end 

    def min_max_start_dist(layer) do
      {layer, 2 * layer, (2 * layer) - 1}
    end
  end


  defmodule Part2 do

    defstruct [
      distance: 1,
      traveled: 0,
      travel_times: 0,
      direction: :right,
      current: {0, 0},
      map: %{ {0, 0} => 1}
    ]

    def additive_squares() do
      Stream.resource(
        fn -> %Part2{} end,
        fn(%Part2{current: current, map: map} = state) ->
          {[map[current]], update(state)}
        end,
        fn(%Part2{} = state) -> state end
      )
    end

    def map_value({x, y}, %Part2{map: map}) do
      case Map.fetch(map, {x, y}) do
        {:ok, value} -> value
        _ -> 0
      end
    end

    def rotate(:right), do: :up
    def rotate(:up), do: :left
    def rotate(:left), do: :down
    def rotate(:down), do: :right

    def check_distance(%Part2{travel_times: travel_times, distance: distance} = state) do
      case travel_times do
        2 -> %Part2{state | travel_times: 0, distance: distance + 1}
        _ -> state  
      end
    end

    def step(%Part2{direction: :right, current: {x, y}, traveled: traveled} = state), do: %Part2{state | current: {x + 1, y}, traveled: traveled + 1} 
    def step(%Part2{direction: :up, current: {x, y}, traveled: traveled} = state), do: %Part2{state | current: {x, y + 1}, traveled: traveled + 1} 
    def step(%Part2{direction: :left, current: {x, y}, traveled: traveled} = state), do: %Part2{state | current: {x - 1, y}, traveled: traveled + 1} 
    def step(%Part2{direction: :down, current: {x, y}, traveled: traveled} = state), do: %Part2{state | current: {x, y - 1}, traveled: traveled + 1} 

    def rotate_check(%Part2{traveled: traveled, travel_times: travel_times, distance: distance, direction: direction} = state) do
      case traveled == distance do
        true -> %Part2{state | traveled: 0, travel_times: travel_times + 1, direction: rotate(direction)}
        false -> state
      end
    end

    def calculate_value(%Part2{current: {x, y}, map: map} = state) do
      [
        {x + 1, y},
        {x + 1, y + 1},
        {x, y + 1},
        {x - 1, y + 1},
        {x - 1, y},
        {x - 1, y - 1},
        {x, y - 1},
        {x + 1, y - 1}
      ]
        |> Enum.reduce(0, fn(pos, sum) -> map_value(pos, state) + sum end)
        |> (fn(val) -> %Part2{state | map: Map.put(map, {x, y}, val)} end).()
    end

    def update(state) do
      state
        |> check_distance
        |> step
        |> rotate_check
        |> calculate_value
    end
  end
end
