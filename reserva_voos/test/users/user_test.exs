defmodule ReservaVoos.Users.UserTest do
  use ExUnit.Case

  import ReservaVoos.Factory

  alias ReservaVoos.Users.User

  describe "build/3" do
    test "when all params are valid, returns the user" do
      response = User.build("Renan", "renan@gmail.com", "12345678900")

      {:ok, %User{id: id}} = response
      expected_response = {:ok, build(:user, id: id)}

      assert response == expected_response
    end

    test "when the params are invalid, returns an error" do
      response = User.build("renan", "renan@gmail.com", 123)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
