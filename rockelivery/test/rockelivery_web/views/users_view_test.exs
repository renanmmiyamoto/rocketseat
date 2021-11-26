defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{
             message: "User created",
             user: %Rockelivery.User{
               address: "Rua aaa",
               age: 19,
               cep: "12345678",
               cpf: "12345678900",
               email: "renan@gmail.com",
               id: "bd802237-d69d-4493-acc1-45acea4951c8",
               inserted_at: nil,
               name: "Renan Miyamoto",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             }
           } = response
  end
end
