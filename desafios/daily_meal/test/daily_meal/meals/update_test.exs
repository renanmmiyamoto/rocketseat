defmodule DailyMeal.Meals.UpdateTest do
  use DailyMeal.DataCase, async: true

  import DailyMeal.Factory

  alias DailyMeal.Meal
  alias DailyMeal.Meals.Create
  alias DailyMeal.Meals.Update

  describe "call/1" do
    test "when all params are valid, returns the meal" do
      {:ok, %Meal{id: id}} =
        :meal_params
        |> build()
        |> Create.call()

      response =
        Update.call(%{
          "id" => id,
          "description" => "Teste update"
        })

      assert {:ok, %Meal{description: "Teste update"}} = response
    end

    test "when there are invalid params, returns an error" do
      {:ok, %Meal{id: id}} =
        :meal_params
        |> build()
        |> Create.call()

      response =
        Update.call(%{
          "id" => id,
          "calories" => -10
        })

      {:error, %{result: changeset}} = response

      expected_response = %{calories: ["must be greater than or equal to 0"]}

      assert errors_on(changeset) == expected_response
    end
  end
end
