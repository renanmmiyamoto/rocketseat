defmodule Rockelivery.OrderItemsParams do
  use Ecto.Schema

  import Ecto.Changeset

  @required_params [:quantity]

  @derive {Jason.Encoder, only: @required_params}

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "order_items_params" do
    field :quantity, :integer
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    IO.inspect(params, label: "COMEÇOU =========")

    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_number(:quantity, greater_than: 0)
  end
end
