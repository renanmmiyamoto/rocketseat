defmodule Rockelivery.Orders.Create do
  import Ecto.Query

  alias Ecto.Changeset
  alias Rockelivery.{Error, Item, Repo, Order}
  alias Rockelivery.Orders.ValidateAndMultiplyItems
  alias Rockelivery.OrderItemsParams

  def call(%{"items" => items_params} = params) do
    validate_items_params(items_params)

    items_ids = Enum.map(items_params, fn item -> item["id"] end)

    query = from item in Item, where: item.id in ^items_ids

    query
    |> Repo.all()
    |> ValidateAndMultiplyItems.call(items_ids, items_params)
    |> handle_items(params)
  end

  defp handle_items({:ok, items}, params) do
    params
    |> Order.changeset(items)
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_items({:error, result}, _params), do: {:error, Error.build(:bad_request, result)}

  defp handle_insert({:ok, %Order{}} = order), do: order
  defp handle_insert({:error, result}), do: {:error, Error.build(:bad_request, result)}

  defp validate_items_params(items_params) do
    items_params
    |> Enum.map(fn item -> OrderItemsParams.changeset(item) end)
    |> Enum.find?(fn %Changeset{valid?: valid} -> valid == false end)
    |> IO.inspect(label: "KLFAHJSLFJHALKSJ")
  end
end

# valid_items_params =
#   items_params
#   |> Enum.map(fn item ->
#     %Changeset{valid?: valid_items} = result = OrderItemsParams.changeset(item)

#     IO.inspect(result)
#     IO.inspect(valid_items)
#     valid_items
#   end)
#   |> Enum.any?(fn value -> value == false end)
#   |> IO.inspect(label: "MEU DEUS, NAO FAÇO IDEIA SE VAI FUNFA")
