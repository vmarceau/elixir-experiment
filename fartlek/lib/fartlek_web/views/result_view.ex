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
end
