defmodule ListLengthTest do
  use ExUnit.Case

  describe "ListLength" do
    test "get lenght of some list" do
      list = [6, 5, 4, 3, 2, 1]

      response = ListLength.call(list)

      expected_response = 6

      assert response == expected_response
    end
  end
end
