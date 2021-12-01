defmodule DailyMeal.Meals.Show do
  alias Ecto.UUID
  alias DailyMeal.{Repo, Meal}

  def by_id(id) do
    case UUID.cast(id) do
      :error -> {:error, %{status: :bad_request, result: "Invalid id format!"}}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Meal, uuid) do
      %Meal{} = meal -> {:ok, meal}
      nil -> {:error, %{status: :not_found, result: "Meal not found"}}
    end
  end
end
