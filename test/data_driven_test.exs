defmodule DataDrivenTest do
  use ExUnit.Case

  #data = [
  #  {1, 3, 4} ,
  #  {7, 4, 11} # Error intencional
  #]

  data = File.stream!("fixtures/sum_data.csv") 
        |> Enum.map(&(String.split(&1))) 
        |> Enum.map(&(String.split(List.first(&1),","))) 
        |> Enum.map(
          fn([x,y,z]) -> 
            { String.to_integer(x), String.to_integer(y), String.to_integer(z) } 
          end
        )

  for {a,b,c} <- data do
    @a a
    @b b
    @c c
    test "sum of #{@a} and #{@b} should equal #{@c}" do  
      assert FooCalculator.add(@a,@b) == @c 
    end
  end

  test "The sum of no numbers should not be matched" do
    assert_raise FunctionClauseError, "no function clause matching in FooCalculator.add/2", 
    fn ->
      FooCalculator.add("a","b") 
    end
  end




end
