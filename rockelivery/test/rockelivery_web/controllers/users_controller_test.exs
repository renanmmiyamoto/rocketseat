defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{
        "age" => 19,
        "address" => "Rua aaa",
        "cep" => "12345678",
        "cpf" => "12345678900",
        "email" => "renan@gmail.com",
        "password" => "123456",
        "name" => "Renan Miyamoto"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created",
               "user" => %{
                 "address" => "Rua aaa",
                 "age" => 19,
                 "cpf" => "12345678900",
                 "email" => "renan@gmail.com"
               }
             } = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = %{
        age: 19,
        address: "Rua aaa",
        password: "123456"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      assert %{
               "message" => %{
                 "cep" => ["can't be blank"],
                 "cpf" => ["can't be blank"],
                 "email" => ["can't be blank"],
                 "name" => ["can't be blank"]
               }
             } = response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "bd802237-d69d-4493-acc1-45acea4951c8"
      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert "" = response
    end
  end
end
