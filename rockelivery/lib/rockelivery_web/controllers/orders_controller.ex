defmodule RockeliveryWeb.OrdersController do
  use RockeliveryWeb, :controller

  alias Rockelivery.Order
  alias RockeliveryWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Order{} = order} <- Rockelivery.create_order(params) do
      conn
      |> put_status(:created)
      |> render("create.json", order: order)
    end
  end

  # def show(conn, %{"id" => id}) do
  #   with {:ok, %Order{} = order} <- Rockelivery.get_user_by_id(id) do
  #     conn
  #     |> put_status(:ok)
  #     |> render("order.json", order: order)
  #   end
  # end

  # def update(conn, params) do
  #   with {:ok, %Order{} = order} <- Rockelivery.update_user(params) do
  #     conn
  #     |> put_status(:ok)
  #     |> render("order.json", order: order)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   with {:ok, %Order{}} <- Rockelivery.delete_user(id) do
  #     conn
  #     |> put_status(:no_content)
  #     |> text("")
  #   end
  # end
end
