defmodule ElixirExercises.CalculatorTest do 
  use ExUnit.Case
  import ElixirExercises.Calculator, only: [start: 0 , value: 1 , add: 2 , sub: 2 ]
  setup  do 
      context = %{ calculator_pid: start}
    {:ok, context}
  end
  test "The initial value must be 0", %{calculator_pid: calculator_pid}  do
    IO.puts inspect calculator_pid
    value(calculator_pid) == 0
  end

  test "The add operation must be current_value plus the parameter " , %{calculator_pid: calculator_pid} do
    IO.puts inspect calculator_pid
    add(calculator_pid, 10)
    value(calculator_pid) == 10
  end
  test "The sub  operation must be current_value minus the parameter " , %{calculator_pid: calculator_pid} do
    IO.puts inspect calculator_pid
    sub(calculator_pid, 10)
    value(calculator_pid) == -10
  end
end
