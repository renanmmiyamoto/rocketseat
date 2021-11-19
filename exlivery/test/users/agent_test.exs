defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent

  import Exlivery.Factory

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      cpf = "09876543211"

      {:ok, cpf: cpf}
    end

    test "when the user is found, returns the user", %{cpf: cpf} do
      user = build(:user, cpf: cpf)
      UserAgent.save(user)

      response = UserAgent.get(cpf)

      expected_response = {:ok, user}

      assert response == expected_response
    end

    test "when the user is not found, returns an error", %{cpf: cpf} do
      response = UserAgent.get(cpf)

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
