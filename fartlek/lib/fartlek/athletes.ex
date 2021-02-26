defmodule Fartlek.Athletes do
  import Ecto.Query, warn: false
  alias Fartlek.Repo
  alias Fartlek.Athletes.Athlete

  def list_athletes do
    Repo.all(Athlete)
  end

  def get_athlete!(id), do: Repo.get!(Athlete, id)

  def create_athlete(attrs \\ %{}) do
    %Athlete{}
    |> Athlete.changeset(attrs)
    |> Repo.insert()
  end

   def update_athlete(%Athlete{} = athlete, attrs) do
    athlete
    |> Athlete.changeset(attrs)
    |> Repo.update()
  end

    def delete_athlete(%Athlete{} = athlete) do
    Repo.delete(athlete)
  end

  def change_athlete(%Athlete{} = athlete, attrs \\ %{}) do
    Athlete.changeset(athlete, attrs)
  end
end
