defmodule DailyMeal.MealTest do
  use DailyMeal.DataCase, async: true

  import DailyMeal.Factory

  alias Ecto.Changeset
  alias DailyMeal.Meal

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:meal_params)

      response = Meal.changeset(params)

      assert %Changeset{changes: %{description: "Teste Factory"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = build(:meal_params)

      update_params = %{description: "bananinha"}

      response =
        params
        |> Meal.changeset()
        |> Meal.changeset(update_params)

      assert %Changeset{changes: %{description: "bananinha"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = build(:meal_params, %{calories: -10, data: "1231"})

      response = Meal.changeset(params)

      expected_response = %{
        calories: ["must be greater than or equal to 0"],
        data: ["is invalid"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
