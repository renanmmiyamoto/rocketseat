defmodule ReservaVoos.Bookings.Agent do
  use Agent

  alias ReservaVoos.Bookings.Booking

  def start_link(_a) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%Booking{} = booking) do
    Agent.update(__MODULE__, &update_state(&1, booking))
  end

  def get(uuid), do: Agent.get(__MODULE__, &get_booking(&1, uuid))
  def get_all(), do: Agent.get(__MODULE__, & &1)

  defp get_booking(state, uuid) do
    case Map.get(state, uuid) do
      nil -> {:error, "Booking not found"}
      booking -> {:ok, booking}
    end
  end

  defp update_state(state, %Booking{id: id} = booking), do: Map.put(state, id, booking)
end
