defmodule :"Elixir.DailyMeal.Repo.Migrations.Create-users" do
  use Ecto.Migration

  def change do
    create table :meals do
      add :description, :string
      add :data, :naive_datetime
      add :calories, :float

      timestamps()
    end
  end
end
