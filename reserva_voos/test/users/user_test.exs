defmodule ReservaVoos.Users.UserTest do
  use ExUnit.Case

  import ReservaVoos.Factory

  alias ReservaVoos.Users.User

  describe "build/3" do
    test "when all params are valid, returns the user" do
      response = User.build("Renan", "renan@gmail.com", "12345678900")

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end
  end
end
