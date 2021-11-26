defmodule ReportsGeneratorTest do
  use ExUnit.Case

  describe "build/1" do
    test "passing some file, should generate report" do
      filename = "report_test.csv"

      response = ReportsGenerator.build(filename)

      expected_response = %{
        "all_hours" => %{
          "Cleiton" => 12,
          "Daniele" => 21,
          "Danilo" => 6,
          "Diego" => 7,
          "Giuliano" => 14,
          "Jakeliny" => 14,
          "Joseph" => 3,
          "Mayk" => 19,
          "Rafael" => 0,
          "Vinicius" => 0
        },
        "hours_per_month" => %{
          "Cleiton" => %{
            "April" => 0,
            "August" => 0,
            "December" => 0,
            "February" => 0,
            "January" => 0,
            "July" => 0,
            "June" => 4,
            "March" => 0,
            "May" => 0,
            "November" => 0,
            "October" => 8,
            "September" => 0
          },
          "Daniele" => %{
            "April" => 7,
            "August" => 0,
            "December" => 5,
            "February" => 0,
            "January" => 0,
            "July" => 0,
            "June" => 1,
            "March" => 0,
            "May" => 8,
            "November" => 0,
            "October" => 0,
            "September" => 0
          },
          "Danilo" => %{
            "April" => 0,
            "August" => 0,
            "December" => 0,
            "February" => 6,
            "January" => 0,
            "July" => 0,
            "June" => 0,
            "March" => 0,
            "May" => 0,
            "November" => 0,
            "October" => 0,
            "September" => 0
          },
          "Diego" => %{
            "April" => 0,
            "August" => 4,
            "December" => 0,
            "February" => 0,
            "January" => 0,
            "July" => 0,
            "June" => 0,
            "March" => 0,
            "May" => 0,
            "November" => 0,
            "October" => 0,
            "September" => 3
          },
          "Giuliano" => %{
            "April" => 1,
            "August" => 0,
            "December" => 0,
            "February" => 9,
            "January" => 0,
            "July" => 0,
            "June" => 0,
            "March" => 0,
            "May" => 4,
            "November" => 0,
            "October" => 0,
            "September" => 0
          },
          "Jakeliny" => %{
            "April" => 0,
            "August" => 0,
            "December" => 0,
            "February" => 0,
            "January" => 0,
            "July" => 8,
            "June" => 0,
            "March" => 6,
            "May" => 0,
            "November" => 0,
            "October" => 0,
            "September" => 0
          },
          "Joseph" => %{
            "April" => 0,
            "August" => 0,
            "December" => 0,
            "February" => 0,
            "January" => 0,
            "July" => 0,
            "June" => 0,
            "March" => 3,
            "May" => 0,
            "November" => 0,
            "October" => 0,
            "September" => 0
          },
          "Mayk" => %{
            "April" => 0,
            "August" => 0,
            "December" => 5,
            "February" => 0,
            "January" => 0,
            "July" => 7,
            "June" => 0,
            "March" => 0,
            "May" => 0,
            "November" => 0,
            "October" => 0,
            "September" => 7
          },
          "Rafael" => %{
            "April" => 0,
            "August" => 0,
            "December" => 0,
            "February" => 0,
            "January" => 0,
            "July" => 0,
            "June" => 0,
            "March" => 0,
            "May" => 0,
            "November" => 0,
            "October" => 0,
            "September" => 0
          },
          "Vinicius" => %{
            "April" => 0,
            "August" => 0,
            "December" => 0,
            "February" => 0,
            "January" => 0,
            "July" => 0,
            "June" => 0,
            "March" => 0,
            "May" => 0,
            "November" => 0,
            "October" => 0,
            "September" => 0
          }
        },
        "hours_per_year" => %{
          "Cleiton" => %{2016 => 3, 2017 => 0, 2018 => 0, 2019 => 0, 2020 => 9},
          "Daniele" => %{2016 => 10, 2017 => 3, 2018 => 7, 2019 => 0, 2020 => 1},
          "Danilo" => %{2016 => 0, 2017 => 0, 2018 => 0, 2019 => 6, 2020 => 0},
          "Diego" => %{2016 => 3, 2017 => 4, 2018 => 0, 2019 => 0, 2020 => 0},
          "Giuliano" => %{2016 => 0, 2017 => 3, 2018 => 0, 2019 => 6, 2020 => 5},
          "Jakeliny" => %{2016 => 0, 2017 => 8, 2018 => 0, 2019 => 6, 2020 => 0},
          "Joseph" => %{2016 => 0, 2017 => 3, 2018 => 0, 2019 => 0, 2020 => 0},
          "Mayk" => %{2016 => 7, 2017 => 8, 2018 => 0, 2019 => 4, 2020 => 0},
          "Rafael" => %{2016 => 0, 2017 => 0, 2018 => 0, 2019 => 0, 2020 => 0},
          "Vinicius" => %{2016 => 0, 2017 => 0, 2018 => 0, 2019 => 0, 2020 => 0}
        }
      }

      assert expected_response == response
    end
  end
end
