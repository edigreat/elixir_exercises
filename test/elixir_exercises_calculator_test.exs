defmodule ElixirExercises.CalculatorTest do 
  use ExUnit.Case
  import ElixirExercises.Calculator, only: [start: 0 , value: 1 ]
  setup do 
    context = %{ calculator_pid: start}
    {:ok, context}
  end
  test "The initial value must be 0", %{calculator_pid: calculator_pid}  do
  value(calculator_pid) == 0
  end
end
