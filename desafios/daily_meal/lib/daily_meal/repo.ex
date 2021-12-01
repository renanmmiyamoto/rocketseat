defmodule DailyMeal.Repo do
  use Ecto.Repo,
    otp_app: :daily_meal,
    adapter: Ecto.Adapters.Postgres
end
