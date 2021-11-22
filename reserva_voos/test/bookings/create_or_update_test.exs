defmodule ReservaVoos.Bookings.CreateOrUpdateTest do
  use ExUnit.Case

  import ReservaVoos.Factory

  alias ReservaVoos.Bookings.CreateOrUpdate
  alias ReservaVoos.Users.Agent, as: UserAgent
  alias ReservaVoos.Users.User

  describe "call/3" do
    setup do
      ReservaVoos.start_agents()

      user = build(:user)
      UserAgent.save(user)

      %User{id: user_id} = user

      {:ok, user_id: user_id}
    end

    test "when all params are valid, save the booking", %{user_id: user_id} do
      params = %{
        complete_date: "2021-12-22 16:30:40",
        local_origin: "São Paulo",
        local_destination: "Curitiba",
        user_id: user_id
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "Booking created or updated successfully"}

      assert response == expected_response
    end

    test "when the user not exist, returns an error" do
      params = %{
        complete_date: "2021-14-22 16:30:40",
        local_origin: "São Paulo",
        local_destination: "Curitiba",
        user_id: "4802223b-1437-40a5-8d7b-59de3c92b3eb"
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end

    test "when the params are invalid, returns an error" do
      params = %{
        complete_date: "2021-14-22 16:30:40",
        local_origin: "São Paulo",
        local_destination: "Curitiba",
        user_id: "asdas"
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
