defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Item

  describe "build/5" do
    test "when all params are valid, returns an item" do
      response = Item.build("Pizza de frango", :pizza, "30.50", 2)

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "there is an invalid category, returns an error" do
      response = Item.build("Pizza de frango", :pizzaa, "30.50", 2)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "there is an invalid price, returns an error" do
      response = Item.build("Pizza de frango", :pizza, "banana_price", 2)

      expected_response = {:error, "Invalid price"}

      assert response == expected_response
    end

    test "there is an invalid quantity, returns an error" do
      response = Item.build("Pizza de frango", :pizza, "30.50", 0)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
