defmodule ElixirExercises.Calculator do
  def start do
    spawn( fn -> loop(0) end )
  end

  def value(calculator_pid) do
    send(calculator_pid,:value)
  end

  defp loop(current_value) do
    receive do
      :value -> current_value
    end
    loop(current_value)
  end

end
