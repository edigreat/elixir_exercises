defmodule ElixirExercises.Calculator do
  def start do
    spawn( fn -> loop(0) end )
  end

  def value(calculator_pid) do
    send(calculator_pid,:value)
  end

  def add(calculator_pid, value) do
    send(calculator_pid, { :add , value}) 
  end
  def sub(calculator_pid, value) do
    send(calculator_pid, { :sub, value})
  end
  defp loop(current_value) do
    receive do
      :value -> current_value
      { :add , value } -> current_value =  current_value + value
      { :sub , value } -> current_value =  current_value - value
    end
    loop(current_value)
  end

end
