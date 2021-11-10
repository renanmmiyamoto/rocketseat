defmodule ListFilter do
  def call(list) do
    list
    |> Enum.map(fn el -> parse_element(el) end)
    |> Enum.filter(fn el -> is_number(el) && rem(el, 2) != 0 end)
    |> Enum.count()
  end

  defp parse_element(element) do
    case Integer.parse(element) do
      {number, _rest} -> number
      :error -> false
    end
  end
end
