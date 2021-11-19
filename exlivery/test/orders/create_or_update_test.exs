defmodule Exlivery.Orders.CreateOrUpdateTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.CreateOrUpdate
  alias Exlivery.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      Exlivery.start_agents()

      cpf = "12345678900"
      user = build(:user, cpf: cpf)

      UserAgent.save(user)

      item1 = %{
        description: "Pizza de peperonni",
        category: :pizza,
        unity_price: 30.50,
        quantity: 1
      }

      item2 = %{
        description: "Sashimi",
        category: :japonesa,
        unity_price: 50.00,
        quantity: 2
      }

      {:ok, user_cpf: cpf, item1: item1, item2: item2}
    end

    test "when all params are valid, saves the order", %{
      user_cpf: cpf,
      item1: item1,
      item2: item2
    } do
      params = %{user_cpf: cpf, items: [item1, item2]}

      response = CreateOrUpdate.call(params)

      assert {:ok, _uuid} = response
    end

    test "when there is no user with given cpf, returns an error", %{
      item1: item1,
      item2: item2
    } do
      params = %{user_cpf: "123456", items: [item1, item2]}

      response = CreateOrUpdate.call(params)

      assert {:error, "User not found"} = response
    end

    test "when quantity is invalid, saves the order", %{
      user_cpf: cpf,
      item1: item1,
      item2: item2
    } do
      params = %{user_cpf: cpf, items: [%{item1 | quantity: 0}, item2]}

      response = CreateOrUpdate.call(params)

      assert {:error, "Invalid items"} = response
    end

    test "when there is no items, saves the order", %{user_cpf: cpf} do
      params = %{user_cpf: cpf, items: []}

      response = CreateOrUpdate.call(params)

      assert {:error, "Invalid parameters"} = response
    end
  end
end
