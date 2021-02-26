defmodule FartlekWeb.ResultView do
  use FartlekWeb, :view
  alias FartlekWeb.ResultView

  def render("index.json", %{results: results}) do
    %{data: render_many(results, ResultView, "result.json")}
  end

  def render("show.json", %{result: result}) do
    %{data: render_one(result, ResultView, "result.json")}
  end

  def render("result.json", %{result: result}) do
    %{id: result.id,
      race_id: result.race_id,
      athlete_id: result.athlete_id,
      total_time: result.total_time,
      status: result.status}
  end

  def render("athlete_result.json", %{result: result}) do
    %{year: result.year,
      athlete_first_name: result.athlete.first_name,
      athlete_last_name: result.athlete.last_name,
      total_time: result.total_time,
      status: result.status}
  end

  def render("race_result.json", %{result: result}) do
    %{year: result.year,
      race_name: result.race.name,
      race_distance: result.race.distance,
      total_time: result.total_time,
      status: result.status}
  end
end
