defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.CreateOrUpdate
  alias Exlivery.Users.Agent, as: UserAgent

  import Exlivery.Factory

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the user" do
      user = build(:user)

      response = CreateOrUpdate.call(user)

      expected_response = {:ok, "User created or updated successfully"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      user = build(:user, age: 10)

      response = CreateOrUpdate.call(user)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
