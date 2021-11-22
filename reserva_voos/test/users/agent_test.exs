defmodule ReservaVoos.Users.AgentTest do
  use ExUnit.Case

  alias ReservaVoos.Users.Agent, as: UserAgent
  alias ReservaVoos.Users.User

  import ReservaVoos.Factory

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

      %User{id: id} = build(:user)

      {:ok, id: id}
    end

    test "when the user is found, returns the user", %{id: id} do
      user = build(:user, id: id)
      UserAgent.save(user)

      response = UserAgent.get(id)

      expected_response = {:ok, user}

      assert response == expected_response
    end

    test "when the user is not found, returns an error", %{id: id} do
      response = UserAgent.get(id)

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end

  describe "get_all/1" do
    test "Get all bookings saved" do
      ReservaVoos.start_agents()

      user = build(:user)
      UserAgent.save(user)

      response = UserAgent.get_all()

      %User{id: id} = user

      expected_response = %{id => user}

      assert response == expected_response
    end
  end
end
