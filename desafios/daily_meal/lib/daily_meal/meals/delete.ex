defmodule DailyMeal.Meals.Delete do
  alias Ecto.UUID
  alias DailyMeal.{Repo, Meal}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, %{status: :bad_request, result: "Invalid id format!"}}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case Repo.get(Meal, uuid) do
      nil -> {:error, %{status: :not_found, result: "Meal not found"}}
      meal -> Repo.delete(meal)
    end
  end
end
