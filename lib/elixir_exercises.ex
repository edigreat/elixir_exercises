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

