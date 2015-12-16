defmodule ElixirExercises.ExerciseTwoTest do
  use ExUnit.Case
  setup do
    context = %{ tax_rate: [ NC: 0.075, TX: 0.08 ],
      orders:  [
    [ id: 123, ship_to: :NC, net_amount: 100.00 ],
    [ id: 124, ship_to: :OK, net_amount:  35.50 ], 
    [ id: 125, ship_to: :TX, net_amount:  24.00 ],
    [ id: 126, ship_to: :TX, net_amount:  44.80 ],
    [ id: 127, ship_to: :NC, net_amount:  25.00 ],
    [ id: 128, ship_to: :MA, net_amount:  10.00 ],
    [ id: 129, ship_to: :CA, net_amount: 102.00 ],
    [ id: 120, ship_to: :NC, net_amount:  50.00 ] ] ,
    result: [
    [id: 123, ship_to: :NC, net_amount: 100.0, total_amount: 108.0],
    [id: 124, ship_to: :OK, net_amount: 35.5],
    [id: 125, ship_to: :TX, net_amount: 24.0, total_amount: 25.92],
    [id: 126, ship_to: :TX, net_amount: 44.8, total_amount: 48.384],
    [id: 127, ship_to: :NC, net_amount: 25.0, total_amount: 27.0],
    [id: 128, ship_to: :MA, net_amount: 10.0],
    [id: 129, ship_to: :CA, net_amount: 102.0],
    [id: 120, ship_to: :NC, net_amount: 50.0, total_amount: 54.0]]
    }

    {:ok, context}

  end
  
  test "it should return a word with a prefix",%{tax_rate: tax_rate, orders: orders, result: result } do
    orders_with_taxes = ElixirExercises.ExerciseTwo.tax_calculate(tax_rate,orders)
    assert result == orders_with_taxes
  end


end
