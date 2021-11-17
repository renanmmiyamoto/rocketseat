defmodule ReportsGenerator do
  @available_users [
    "Daniele",
    "Mayk",
    "Giuliano",
    "Cleiton",
    "Jakeliny",
    "Joseph",
    "Diego",
    "Danilo",
    "Rafael",
    "Vinicius"
  ]

  @available_months [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ]

  @available_years [2016, 2017, 2018, 2019, 2020]

  def build(filename) do
    filename
    |> ReportsGenerator.Parser.parse_file()
    |> Enum.reduce(report_acc(), &sum_values(&1, &2))
  end

  def build_from_many(filenames) when is_list(filenames) do
    filenames
    |> Task.async_stream(&build/1)
    |> Enum.reduce(report_acc(), fn {:ok, result}, report -> sum_reports(report, result) end)
  end

  defp sum_values([name, hours_worked, _day, month, year], %{
         "all_hours" => all_hours,
         "hours_per_month" => hours_per_month,
         "hours_per_year" => hours_per_year
       }) do
    all_hours = Map.put(all_hours, name, all_hours[name] + hours_worked)

    hours_per_month =
      hours_per_month
      |> Map.put(
        name,
        Map.put(
          hours_per_month[name],
          translate_month(month),
          hours_per_month[name][translate_month(month)] + hours_worked
        )
      )

    hours_per_year =
      hours_per_year
      |> Map.put(
        name,
        Map.put(
          hours_per_year[name],
          year,
          hours_per_year[name][year] + hours_worked
        )
      )

    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end

  defp sum_reports(
         %{
           "all_hours" => all_hours1,
           "hours_per_month" => hours_per_month1,
           "hours_per_year" => hours_per_year1
         },
         %{
           "all_hours" => all_hours2,
           "hours_per_month" => hours_per_month2,
           "hours_per_year" => hours_per_year2
         }
       ) do
    all_hours = Map.merge(all_hours1, all_hours2, fn _key, val1, val2 -> val1 + val2 end)
    hours_per_month = merge_maps(hours_per_month1, hours_per_month2)
    hours_per_year = merge_maps(hours_per_year1, hours_per_year2)

    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end

  defp merge_maps(map1, map2) do
    Map.merge(map1, map2, fn _key, val1, val2 ->
      Map.merge(val1, val2, fn _key, teste1, teste2 -> teste1 + teste2 end)
    end)
  end

  defp translate_month(month_number) when is_integer(month_number) do
    Enum.at(@available_months, month_number - 1)
  end

  defp report_acc() do
    all_hours = Enum.into(@available_users, %{}, &{&1, 0})

    months = Enum.into(@available_months, %{}, &{&1, 0})
    hours_per_month = Enum.into(@available_users, %{}, &{&1, months})

    years = Enum.into(@available_years, %{}, &{&1, 0})
    hours_per_year = Enum.into(@available_users, %{}, &{&1, years})

    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end
end
