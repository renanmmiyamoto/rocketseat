defmodule ReservaVoos.Bookings.ReportTest do
  use ExUnit.Case

  import ReservaVoos.Factory

  alias ReservaVoos.Bookings.Agent, as: BookingAgent
  alias ReservaVoos.Bookings.Report

  describe "generate_report/2" do
    setup do
      ReservaVoos.start_agents()

      :ok
    end

    test "when all params are valid, returns the booking list, between the range date" do
      build_list(2, :booking)
      |> Enum.map(fn booking -> BookingAgent.save(booking) end)

      response = Report.generate_report("2021-11-01 00:00:01", "2022-11-01 00:00:01")

      expected_response = {:ok, "Report generated successfully"}

      assert response == expected_response
    end

    test "when the params are invalid, returns an error" do
      build_list(2, :booking)
      |> Enum.map(fn booking -> BookingAgent.save(booking) end)

      response = Report.generate_report("2021-11-01 00:00:01", "2022-11-01")

      expected_response = {:error, :invalid_format}

      assert response == expected_response
    end

    test "with bookings is an empty list, returns an error" do
      response = Report.generate_report("2021-11-01 00:00:01", "2022-11-01 00:00:01")

      expected_response = {:error, "No bookings founded with this range date"}

      assert response == expected_response
    end
  end
end
