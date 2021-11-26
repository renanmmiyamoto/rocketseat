defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      age: 19,
      address: "Rua aaa",
      cep: "12345678",
      cpf: "12345678900",
      email: "renan@gmail.com",
      password: "123456",
      name: "Renan Miyamoto"
    }
  end

  def user_factory do
    %User{
      age: 19,
      address: "Rua aaa",
      cep: "12345678",
      cpf: "12345678900",
      email: "renan@gmail.com",
      password: "123456",
      name: "Renan Miyamoto",
      id: "bd802237-d69d-4493-acc1-45acea4951c8"
    }
  end
end
