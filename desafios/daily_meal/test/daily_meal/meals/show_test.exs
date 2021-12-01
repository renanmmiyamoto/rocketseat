defmodule DailyMeal.Meals.ShowTest do
  use DailyMeal.DataCase, async: true

  import DailyMeal.Factory

  alias DailyMeal.Meal
  alias DailyMeal.Meals.Create
  alias DailyMeal.Meals.Show

  describe "by_id/1" do
    test "when all params are valid, returns the meal" do
      params = build(:meal_params)

      {:ok, %Meal{id: id}} = Create.call(params)

      response = Show.by_id(id)

      assert {:ok, %Meal{description: "Teste Factory"}} = response
    end

    test "when there are invalid id, returns an error" do
      response = Show.by_id("bd802237-d69d-4493-acc1-45acea4951c8")

      expected_response = {:error, %{result: "Meal not found", status: :not_found}}

      assert response == expected_response
    end
  end
end
