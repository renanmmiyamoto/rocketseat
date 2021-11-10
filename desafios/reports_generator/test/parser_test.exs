defmodule ReportsGenerator.ParserTest do
  use ExUnit.Case

  describe "parse_file/1" do
    test "passing some file, should get data in list" do
      filename = "report_test.csv"

      response =
        ReportsGenerator.Parser.parse_file(filename)
        |> Enum.map(& &1)

      expected_response = [
        ["Daniele", 7, 29, 4, 2018],
        ["Mayk", 4, 9, 12, 2019],
        ["Daniele", 5, 27, 12, 2016],
        ["Mayk", 1, 2, 12, 2017],
        ["Giuliano", 3, 13, 2, 2017],
        ["Cleiton", 1, 22, 6, 2020],
        ["Giuliano", 6, 18, 2, 2019],
        ["Jakeliny", 8, 18, 7, 2017],
        ["Joseph", 3, 17, 3, 2017],
        ["Jakeliny", 6, 23, 3, 2019],
        ["Cleiton", 3, 20, 6, 2016],
        ["Daniele", 5, 1, 5, 2016],
        ["Giuliano", 1, 2, 4, 2020],
        ["Daniele", 3, 5, 5, 2017],
        ["Daniele", 1, 26, 6, 2020],
        ["Diego", 3, 11, 9, 2016],
        ["Mayk", 7, 28, 7, 2017],
        ["Mayk", 7, 3, 9, 2016],
        ["Danilo", 6, 28, 2, 2019],
        ["Diego", 4, 15, 8, 2017],
        ["Cleiton", 8, 3, 10, 2020],
        ["Giuliano", 4, 24, 5, 2020]
      ]

      assert expected_response == response
    end
  end
end
