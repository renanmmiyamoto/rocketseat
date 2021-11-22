defmodule ReservaVoos.Bookings.AgentTest do
  use ExUnit.Case

  import ReservaVoos.Factory

  alias ReservaVoos.Bookings.Agent, as: BookingAgent
  alias ReservaVoos.Bookings.Booking
  alias ReservaVoos.Users.User

  describe "save/1" do
    test "saves the booking" do
      ReservaVoos.start_agents()

      %User{id: user_id} = build(:user)

      booking = build(:booking, user_id: user_id)

      assert BookingAgent.save(booking) == :ok
    end
  end

  describe "get/1" do
    setup do
      ReservaVoos.start_agents()

      %User{id: user_id} = build(:user)

      {:ok, user_id: user_id}
    end

    test "when the booking is found, returns the booking", %{user_id: user_id} do
      booking = build(:booking, user_id: user_id)
      BookingAgent.save(booking)

      %Booking{id: id} = booking

      response = BookingAgent.get(id)

      expected_response = {:ok, booking}

      assert response == expected_response
    end

    test "when the booking is not found, returns an error", %{user_id: user_id} do
      response = BookingAgent.get(user_id)

      expected_response = {:error, "Booking not found"}

      assert response == expected_response
    end
  end

  describe "get_all/1" do
    test "Get all bookings saved" do
      ReservaVoos.start_agents()

      booking = build(:booking)
      BookingAgent.save(booking)

      response = BookingAgent.get_all()

      %Booking{id: id} = booking

      expected_response = %{id => booking}

      assert response == expected_response
    end
  end
end
