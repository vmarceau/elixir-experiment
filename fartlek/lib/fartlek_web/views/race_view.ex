defmodule FartlekWeb.RaceView do
  use FartlekWeb, :view
  alias FartlekWeb.RaceView

  def render("index.json", %{races: races}) do
    %{data: render_many(races, RaceView, "race.json")}
  end

  def render("show.json", %{race: race}) do
    %{data: render_one(race, RaceView, "race.json")}
  end

  def render("race.json", %{race: race}) do
    %{id: race.id,
      name: race.name,
      country: race.country,
      distance: race.distance,
      total_ascent: race.total_ascent}
  end
end
