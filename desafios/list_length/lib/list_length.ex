defmodule ListLength do
  def call(list), do: list_length(list, 0)

  def list_length([], helper), do: helper

  def list_length([_head | tail], helper) do
    helper = helper + 1
    list_length(tail, helper)
  end
end
