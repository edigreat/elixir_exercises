defmodule Calculator do
  require Logger
  def start do
    spawn( fn -> loop(0) end )
  end

  def value(calculator_pid) do
    send(calculator_pid, %{ :caller =>  self , :operation =>  :value } )
    result = receive do
      current_value -> current_value
      after 5000 -> { :error, :timeout } 
    end
    result 
  end

  def add(calculator_pid, value) do
    send(calculator_pid, { :add , value}) 
  end
  def sub(calculator_pid, value) do
    send(calculator_pid, { :sub, value})
  end

  def mul(calculator_pid, value) do
    send(calculator_pid,{ :mul , value})
  end
  def div(calculator_pid, value) when value > 0 do
    send(calculator_pid, { :div , value} )
  end

  def div(calculator_pid, _) do
    send(calculator_pid, %{ :caller =>  self , :operation =>  :value } )
  end

  defp loop(current_value) do
    updated_value = receive do
      %{ :caller =>  caller , :operation =>  :value }  ->
        send(caller , current_value )
        current_value
      { :add , value } -> current_value + value
      { :sub , value } -> current_value - value
      { :mul , value } -> current_value * value
      { :div , value } -> 
          if current_value > 0  do 
            (current_value / value) 
          else 
            0
          end
      message -> Logger.error "Unkown message"
    end
    loop(updated_value)
  end

end
