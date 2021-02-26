defmodule Fartlek.Accounts do
  import Ecto.Query, warn: false
  alias Fartlek.Repo
  alias Fartlek.Accounts.User

  def get_user!(id), do: Repo.get!(User, id)

  def get_by_email(email) do
    case Repo.get_by(User, email: email) do
      nil ->
        {:error, :not_found}

      user ->
        {:ok, user}
    end
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end
