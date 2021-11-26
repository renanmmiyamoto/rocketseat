defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Report

  describe "create/1" do
    test "creates the report" do
      OrderAgent.start_link(%{})

      :order
      |> build()
      |> OrderAgent.save()

      :order
      |> build()
      |> OrderAgent.save()

      Report.create("report_test.csv")
      response = File.read!("report_test.csv")

      expected_report =
        "12345678900,pizza,2,30.50,japonesa,3,20.40,122.20\n" <>
          "12345678900,pizza,2,30.50,japonesa,3,20.40,122.20\n"

      assert response == expected_report
    end
  end
end
