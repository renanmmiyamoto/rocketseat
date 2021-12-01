defmodule DailyMeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:description, :data, :calories]

  @derive {Jason.Encoder, only: [:description, :data, :calories]}

  schema "meals" do
    field :description, :string
    field :data, :naive_datetime
    field :calories, :float

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_number(:calories, greater_than_or_equal_to: 0)
  end
end
