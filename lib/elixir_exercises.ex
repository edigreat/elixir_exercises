defmodule ElixirExercises.ExerciseOne do
    def prefix(word_prefix) do
        fn(word) ->
          word_prefix <> " " <> word
      end
    end
end


defmodule ElixirExercises.ExerciseTwo do
  def tax_calculate(tax_rate,orders) do
    orders |> Enum.map(&(tax_order_apply(&1,tax_rate)))
  end

  defp tax_order_apply(order,tax_rate) do
    [{_,i},{_,h},{_,amount}] = order
      cond do
        h == :NC or h == :TX -> 
              [id: i, ship_to: h, net_amount: amount, total_amount: tax_apply(amount,tax_rate[:TX])]
        true -> order
      end
  end

  defp tax_apply(amount,tax_rate) do
    amount + amount * tax_rate
  end
end

defmodule ElixirExercises.ExerciseThree do
  def each(list,f) do
     Enum.reduce(list,0,fn(item,_acc) -> f.(item) end)
  end

  def filter(list,f) do
    filter_list = list |>  Enum.reduce([],fn(item,acc) -> check_filter(item,f,acc) end) 
    #filter_list
    Enum.reverse filter_list
  end

  def map(list,f) do
    map_list = list |> Enum.reduce([],fn(item,acc) -> apply_map_function(item,f,acc) end )
    Enum.reverse map_list
  end

  defp check_filter(item,condition,acc) do
    if condition.(item), do: acc = [item|acc]
    acc
  end

  defp apply_map_function({k,v},function,acc) do
    [function.({k,v})|acc]
  end

  defp apply_map_function(item,function,acc) do
      [function.(item) | acc] 
  end
end
