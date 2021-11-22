defmodule ReservaVoos.Bookings.BookingTest do
  use ExUnit.Case

  import ReservaVoos.Factory

  alias ReservaVoos.Bookings.Booking
  alias ReservaVoos.Users.Agent, as: UserAgent
  alias ReservaVoos.Users.User

  describe "build/4" do
    setup do
      UserAgent.start_link(%{})

      user = build(:user)
      UserAgent.save(user)

      %User{id: user_id} = user

      {:ok, user_id: user_id}
    end

    test "when all params are valid, returns the booking", %{user_id: user_id} do
      response = Booking.build("2021-11-22 16:30:40", "São Paulo", "Curitiba", user_id)

      {:ok, %Booking{id: id}} = response
      expected_response = {:ok, build(:booking, id: id, user_id: user_id)}

      assert response == expected_response
    end

    test "when the params are invalid, returns an error", %{user_id: user_id} do
      response = Booking.build("2021-11-22", "São Paulo", "Curitiba", user_id)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
