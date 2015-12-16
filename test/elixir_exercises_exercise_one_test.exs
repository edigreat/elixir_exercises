defmodule ElixirExercises.ExerciseOneTest do
  use ExUnit.Case
  test "it should return a function" do
    assert is_function(ElixirExercises.ExerciseOne.prefix("Mrs"))
  end
  
  test "it should return a static string with a prefix" do
    mrs = ElixirExercises.ExerciseOne.prefix("Mrs")
    assert "Mrs Smith" == mrs.("Smith")
  end

  test "it should return a word with a prefix" do
    assert "Elixir Rocks" == ElixirExercises.ExerciseOne.prefix("Elixir").("Rocks")
  end


end
