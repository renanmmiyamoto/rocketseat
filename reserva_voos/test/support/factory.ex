defmodule ReservaVoos.Factory do
  use ExMachina

  alias ReservaVoos.Bookings.Booking
  alias ReservaVoos.Users.User

  def user_factory do
    uuid = UUID.uuid4()

    %User{
      id: uuid,
      name: "Renan",
      email: "renan@gmail.com",
      cpf: "12345678900"
    }
  end

  def booking_factory do
    user = build(:user)
    uuid = UUID.uuid4()

    %Booking{
      id: uuid,
      complete_date: "2021-11-22 14:00:25",
      local_origin: "São Paulo, SP",
      local_destination: "Curitiba, PR",
      user_id: user.id
    }
  end
end
