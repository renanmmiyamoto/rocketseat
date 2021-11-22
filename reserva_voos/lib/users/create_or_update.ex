defmodule ReservaVoos.Users.CreateOrUpdate do
  alias ReservaVoos.Users.Agent, as: UserAgent
  alias ReservaVoos.Users.User

  def call(%{name: name, email: email, cpf: cpf}) do
    User.build(name, email, cpf)
    |> save_user()
  end

  defp save_user({:ok, %User{} = user}), do: UserAgent.save(user)
  defp save_user({:error, _reason} = error), do: error
end
