defmodule DailyMeal do
  alias DailyMeal.Meals.Create, as: MealCreate
  alias DailyMeal.Meals.Show, as: MealShow
  alias DailyMeal.Meals.Update, as: MealUpdate
  alias DailyMeal.Meals.Delete, as: MealDelete

  defdelegate create_meal(params), to: MealCreate, as: :call
  defdelegate get_meal_by_id(id), to: MealShow, as: :by_id
  defdelegate update_meal(params), to: MealUpdate, as: :call
  defdelegate delete_by_id(id), to: MealDelete, as: :call
end
