defmodule ReservaVoos.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias ReservaVoos.Users.CreateOrUpdate

  describe "call/3" do
    setup do
      ReservaVoos.start_agents()

      :ok
    end

    test "when all params are valid, save the user" do
      params = %{name: "Renan", email: "renan@gmail.com", cpf: "12345678900"}
      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created or updated successfully"}

      assert response == expected_response
    end

    test "when the params are invalid, returns an error" do
      params = %{name: "Renan", email: "renan@gmail.com", cpf: 123_123}
      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
