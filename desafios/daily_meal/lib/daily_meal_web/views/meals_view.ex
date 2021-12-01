defmodule DailyMealWeb.MealsView do
  use DailyMealWeb, :view

  alias DailyMeal.Meal

  def render("create.json", %{meal: %Meal{} = meal}) do
    %{
      message: "Meal created",
      meal: meal
    }
  end

  def render("show.json", %{meal: %Meal{} = meal}), do: %{meal: meal}
end
