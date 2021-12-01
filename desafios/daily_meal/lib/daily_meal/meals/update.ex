defmodule DailyMeal.Meals.Update do
  alias DailyMeal.{Repo, Meal}

  def call(%{"id" => id} = params) do
    case Repo.get(Meal, id) do
      nil -> {:error, %{status: :not_found, result: "Meal not found"}}
      %Meal{} = meal -> do_update(meal, params)
    end
  end

  defp do_update(meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
    |> handle_update()
  end

  defp handle_update({:ok, %Meal{}} = result), do: result

  defp handle_update({:error, result}) do
    {:error, %{status: :bad_request, result: result}}
  end
end
