defmodule FartlekWeb.AthleteView do
  use FartlekWeb, :view
  alias FartlekWeb.AthleteView
  alias FartlekWeb.ResultView

  def render("index.json", %{athletes: athletes}) do
    %{data: render_many(athletes, AthleteView, "athlete.json")}
  end

  def render("show.json", %{athlete: athlete}) do
    %{data: render_one(athlete, AthleteView, "athlete.json")}
  end

  def render("athlete.json", %{athlete: athlete}) do
    %{
      id: athlete.id,
      first_name: athlete.first_name,
      last_name: athlete.last_name,
      country: athlete.country,
      date_of_birth: athlete.date_of_birth
    }
  end

  def render("show_results.json", %{athlete: athlete}) do
    %{data: render_one(athlete, AthleteView, "athlete_results.json")}
  end

  def render("athlete_results.json", %{athlete: athlete}) do
    %{
      id: athlete.id,
      first_name: athlete.first_name,
      last_name: athlete.last_name,
      country: athlete.country,
      date_of_birth: athlete.date_of_birth,
      results: render_many(athlete.results, ResultView, "race_result.json")
    }
  end
end
