defmodule CalculatorTest do 
  use ExUnit.Case
  import Calculator, only: [start: 0 , value: 1 , add: 2 , sub: 2 , mul: 2   ]
  setup  do 
      context = %{ calculator_pid: start}
    {:ok, context}
  end
  test "The initial value must be 0", %{calculator_pid: calculator_pid}  do
    result = value(calculator_pid)
    assert 0  == result
  end

  test "The add operation must be current_value plus the parameter " , %{calculator_pid: calculator_pid} do
    result = value(calculator_pid)
    assert 0  == result
    add(calculator_pid, 10)
    result = value(calculator_pid)
    assert 10 == result
  end
  
  
  test "The sub  operation must be current_value minus the parameter " , %{calculator_pid: calculator_pid} do
    result = value(calculator_pid)
    assert 0  == result
    sub(calculator_pid, 10)
    result = value(calculator_pid)
    assert -10 == result
  end

  test "The mul operation must be current_value multiplied by the parameter ", %{calculator_pid: calculator_pid} do
    result = value(calculator_pid)
    assert 0  == result
    add(calculator_pid,5)
    mul(calculator_pid, 10)
    result = value(calculator_pid) 
    assert 50 == result
  end

  test "The div operation with current value zero must return 0 ", %{calculator_pid: calculator_pid}  do
    result = value(calculator_pid)
    assert 0  == result
    Calculator.div(calculator_pid,1)
    result = value(calculator_pid)
    assert 0 == result
  end

  test "The div operation with parameter zero must return the same current value ", %{calculator_pid: calculator_pid}  do
    result = value(calculator_pid)
    assert 0  == result
    add(calculator_pid,10)
    Calculator.div(calculator_pid,0)
    result = value(calculator_pid) 
    assert  10 == result 
  end
  
  test "The div operation must be current value divide by parameter ", %{calculator_pid: calculator_pid}  do
    result = value(calculator_pid)
    assert 0  == result
    add(calculator_pid,10)
    Calculator.div(calculator_pid,5)
    result = value(calculator_pid) 
    assert 2.0 == result
  end

  test "The Exercise calculator", %{calculator_pid: calculator_pid} do
    result = value(calculator_pid)
    assert 0  == result
    add(calculator_pid,10)
    sub(calculator_pid,5)
    mul(calculator_pid,3)
    Calculator.div(calculator_pid,5)
    result = value(calculator_pid)
    assert 3.0 == result
  end

end
