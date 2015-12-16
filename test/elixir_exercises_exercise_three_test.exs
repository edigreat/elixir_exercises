defmodule ElixirExercises.ExerciseThreeTest do
  use ExUnit.Case
  
  test "it should return the result like Enum.each" do
    list = ["some","example"]
    assert :ok ==  ElixirExercises.ExerciseThree.each(list,&IO.puts/1)
  end

  test "it should return the result like Enum.filter" do
    list = 1..10
    result = ElixirExercises.ExerciseThree.filter(list,&(rem(&1,2) == 0))
    assert [2,4,6,8,10] == result
  end

  test "it should return the result like Enum.map with list parameter" do
    list = 1..5
    result = ElixirExercises.ExerciseThree.map(list,&(&1 * &1))
    assert [1,4,9,16,25] == result
  end

  test "it should return the result like Enum.map with map parameter" do
    list = [a: 1, b: 2, c: 3, d: 4]

    result = ElixirExercises.ExerciseThree.map(list, fn({k,v}) -> {k, -v} end)
    assert [a: -1, b: -2, c: -3, d: -4] == result
  end
  

end
