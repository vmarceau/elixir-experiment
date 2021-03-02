defmodule Fartlek.Athletes do
  import Ecto.Query, warn: false
  alias Fartlek.Repo
  alias Fartlek.Athletes.Athlete
  alias Fartlek.Athletes.Athlete
  alias Fartlek.Results.Result

  def list_athletes do
    Repo.all(Athlete)
  end

  def get_athlete!(id), do: Repo.get!(Athlete, id)

  def get_athlete_results!(id, nil) do
    Repo.get!(Athlete, id)
    |> Repo.preload(
      results:
        from(r in Result,
          preload: :race,
          order_by: [asc: r.year, asc: r.race_id]
        )
    )
  end

  def get_athlete_results!(id, year) do
    Repo.get!(Athlete, id)
    |> Repo.preload(
      results:
        from(r in Result,
          preload: :race,
          where: r.year == ^year,
          order_by: [asc: r.race_id]
        )
    )
  end

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
