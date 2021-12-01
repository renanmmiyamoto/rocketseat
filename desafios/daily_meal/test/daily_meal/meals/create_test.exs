defmodule DailyMeal.Meals.CreateTest do
  use DailyMeal.DataCase, async: true

  import DailyMeal.Factory

  alias DailyMeal.Meal
  alias DailyMeal.Meals.Create

  describe "call/1" do
    test "when all params are valid, returns the meal" do
      params = build(:meal_params)

      response = Create.call(params)

      assert {:ok, %Meal{description: "Teste Factory"}} = response
    end

    test "when there are invalid params, returns an error" do
      params = build(:meal_params, %{calories: -10, data: "1231"})

      response = Create.call(params)

      {:error, %{result: changeset}} = response

      expected_response = %{
        calories: ["must be greater than or equal to 0"],
        data: ["is invalid"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
