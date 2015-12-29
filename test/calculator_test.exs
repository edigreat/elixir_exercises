defmodule ElixirExercises.CalculatorTest do 
  use ExUnit.Case
  import ElixirExercises.Calculator, only: [start: 0 , value: 1 , add: 2 , sub: 2 , mul: 2   ]
  setup  do 
      context = %{ calculator_pid: start}
    {:ok, context}
  end
  test "The initial value must be 0", %{calculator_pid: calculator_pid}  do
    value(calculator_pid)
    assert_receive 0 , 1
  end

  test "The add operation must be current_value plus the parameter " , %{calculator_pid: calculator_pid} do
    add(calculator_pid, 10)
    value(calculator_pid)
    assert_receive 10 , 1
  end
  
  
  test "The sub  operation must be current_value minus the parameter " , %{calculator_pid: calculator_pid} do
    sub(calculator_pid, 10)
    value(calculator_pid)
    assert_receive -10 , 1
  end

  test "The mul operation must be current_value multiplied by the parameter ", %{calculator_pid: calculator_pid} do
    add(calculator_pid,5)
    mul(calculator_pid, 10)
    value(calculator_pid) 
    assert_receive 50 , 1
  end

  test "The div operation with current value equals zero must return 0 ", %{calculator_pid: calculator_pid}  do
    ElixirExercises.Calculator.div(calculator_pid,1)
    value(calculator_pid)
    assert_receive 0 , 1
  end

  test "The div operation with parameter zero must return the same current value ", %{calculator_pid: calculator_pid}  do
    add(calculator_pid,10)
    ElixirExercises.Calculator.div(calculator_pid,0)
    value(calculator_pid) 
    assert_receive 10 , 1
  end
  
  test "The div operation must be current value divide by parameter ", %{calculator_pid: calculator_pid}  do
    add(calculator_pid,10)
    ElixirExercises.Calculator.div(calculator_pid,5)
    value(calculator_pid) 
    assert_receive 2.0 , 1
  end

  test "Exercise calculator", %{calculator_pid: calculator_pid} do
    value(calculator_pid)
    assert_receive 0 , 1

    add(calculator_pid,10)
    sub(calculator_pid,5)
    mul(calculator_pid,3)
    ElixirExercises.Calculator.div(calculator_pid,5)
    value(calculator_pid)
    assert_receive 3.0 , 1

  end

end
