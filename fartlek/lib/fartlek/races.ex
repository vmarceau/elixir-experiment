defmodule Fartlek.Races do
  import Ecto.Query, warn: false
  alias Fartlek.Repo
  alias Fartlek.Races.Race
  alias Fartlek.Results.Result

  def list_races do
    Repo.all(Race)
  end

  def get_race!(id), do: Repo.get!(Race, id)

  def get_race_results!(id, nil) do
    Repo.get!(Race, id)
    |> Repo.preload(
      results:
        from(r in Result,
          preload: :athlete,
          order_by: [asc: r.year, asc: fragment("? NULLS LAST", r.total_time)]
        )
    )
  end

  def get_race_results!(id, year) do
    Repo.get!(Race, id)
    |> Repo.preload(
      results:
        from(r in Result,
          preload: :athlete,
          where: r.year == ^year,
          order_by: [asc: fragment("? NULLS LAST", r.total_time)]
        )
    )
  end

  def create_race(attrs \\ %{}) do
    %Race{}
    |> Race.changeset(attrs)
    |> Repo.insert()
  end

  def update_race(%Race{} = race, attrs) do
    race
    |> Race.changeset(attrs)
    |> Repo.update()
  end

  def delete_race(%Race{} = race) do
    Repo.delete(race)
  end

  def change_race(%Race{} = race, attrs \\ %{}) do
    Race.changeset(race, attrs)
  end
end
