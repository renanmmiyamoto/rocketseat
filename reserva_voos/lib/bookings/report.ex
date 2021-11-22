defmodule ReservaVoos.Bookings.Report do
  alias ReservaVoos.Bookings.Agent, as: BookingsAgent
  alias ReservaVoos.Bookings.Booking

  def generate_report(start_date, end_date) do
    build_booking_list(start_date, end_date)
    |> handle_booking_list()
  end

  defp handle_booking_list({:ok, booking_list}) do
    case File.write("report.csv", booking_list) do
      :ok -> {:ok, "Report generated successfully"}
      _nil -> {:error, "Error on generate report"}
    end
  end

  defp handle_booking_list({:error, _reason}), do: {:error, "Error on generate report"}

  defp build_booking_list(start_date, end_date) do
    list =
      BookingsAgent.get_all()
      |> Map.values()
      |> Enum.map(&booking_string_by_date(&1, start_date, end_date))
      |> Enum.filter(fn booking -> is_bitstring(booking) end)

    if length(list) > 0 do
      {:ok, list}
    else
      {:error, "No bookings founded with this range date"}
    end
  end

  defp booking_string_by_date(
         %Booking{
           complete_date: complete_date,
           local_origin: local_origin,
           local_destination: local_destination,
           user_id: user_id
         },
         start_date,
         end_date
       ) do
    with true <- NaiveDateTime.compare(complete_date, start_date) == :gt,
         true <- NaiveDateTime.compare(complete_date, end_date) == :lt do
      "#{user_id},#{local_origin},#{local_destination},#{complete_date}\n"
    end
  end
end
