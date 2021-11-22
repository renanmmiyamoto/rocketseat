defmodule ReservaVoos.Bookings.Booking do
  alias ReservaVoos.Users.Agent, as: UserAgent
  alias ReservaVoos.Users.User

  @keys [:id, :complete_date, :local_origin, :local_destination, :user_id]
  @enforce_keys @keys

  defstruct @keys

  def build(complete_date, local_origin, local_destination, user_id) do
    with {:ok, __uuid_info} <- UUID.info(user_id),
         {:ok, %User{}} <- UserAgent.get(user_id),
         {:ok, time} <- NaiveDateTime.from_iso8601(complete_date) do
      uuid = UUID.uuid4()

      {:ok,
       %__MODULE__{
         id: uuid,
         complete_date: time,
         local_origin: local_origin,
         local_destination: local_destination,
         user_id: user_id
       }}
    else
      {:error, "User not found"} = error -> error
      _nil -> {:error, "Invalid parameters"}
    end
  end
end
