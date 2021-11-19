defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{Item, Order}
  alias Exlivery.Users.User

  def user_factory do
    %User{
      address: "Rua Miguel Yunes",
      age: 24,
      cpf: "12345678900",
      email: "renan@renan.com",
      name: "Renan"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de frango",
      category: :pizza,
      unity_price: Decimal.new("30.50"),
      quantity: 2
    }
  end

  def order_factory do
    %Order{
      user_cpf: "12345678900",
      delivery_address: "Rua Miguel Yunes",
      items: [
        build(:item),
        build(:item,
          description: "Temaki de atum",
          category: :japonesa,
          quantity: 3,
          unity_price: Decimal.new("20.40")
        )
      ],
      total_price: Decimal.new("122.20")
    }
  end
end
