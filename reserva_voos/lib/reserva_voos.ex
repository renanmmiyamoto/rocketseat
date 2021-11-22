defmodule ReservaVoos do
  alias ReservaVoos.Bookings.Agent, as: BookingAgent
  alias ReservaVoos.Bookings.CreateOrUpdate, as: CreateOrUpdateBooking
  alias ReservaVoos.Users.Agent, as: UserAgent
  alias ReservaVoos.Users.CreateOrUpdate, as: CreateOrUpdateUser

  def start_agents do
    UserAgent.start_link(%{})
    BookingAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate create_or_update_booking(params), to: CreateOrUpdateBooking, as: :call
end
