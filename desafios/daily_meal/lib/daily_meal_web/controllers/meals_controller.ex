defmodule DailyMealWeb.MealsController do
  use DailyMealWeb, :controller

  alias DailyMeal.Meal
  alias DailyMealWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- DailyMeal.create_meal(params) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Meal{} = meal} <- DailyMeal.get_meal_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", meal: meal)
    end
  end

  def update(conn, params) do
    with {:ok, %Meal{} = meal} <- DailyMeal.update_meal(params) do
      conn
      |> put_status(:ok)
      |> render("show.json", meal: meal)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Meal{}} <- DailyMeal.delete_by_id(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end
end
