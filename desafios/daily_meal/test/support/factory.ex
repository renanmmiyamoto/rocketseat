defmodule DailyMeal.Factory do
  use ExMachina.Ecto, repo: DailyMeal.Repo

  alias DailyMeal.Meal

  def meal_params_factory do
    %{
      description: "Teste Factory",
      data: ~N[2021-05-23 00:00:00],
      calories: 4.5,
      id: "bd802237-d69d-4493-acc1-45acea4951c8"
    }
  end

  def meal_factory do
    %Meal{
      description: "Teste Factory",
      data: ~N[2021-05-23 00:00:00],
      calories: 4.5,
      id: "bd802237-d69d-4493-acc1-45acea4951c8"
    }
  end
end
