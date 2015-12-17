defmodule ElixirExercises.ExerciseOneTest do
  use ExUnit.Case
  import ElixirExercises.ExerciseOne, only: [prefix: 1]
  test "it should return a function" do
    assert is_function(prefix("Mrs"))
  end
  
  test "it should return a static string with a prefix" do
    mrs = prefix("Mrs")
    assert "Mrs Smith" == mrs.("Smith")
  end

  test "it should return a word with a prefix" do
    assert "Elixir Rocks" == prefix("Elixir").("Rocks")
  end


end
