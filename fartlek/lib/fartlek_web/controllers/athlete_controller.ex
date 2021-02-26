defmodule FartlekWeb.AthleteController do
  use FartlekWeb, :controller

  alias Fartlek.Athletes
  alias Fartlek.Athletes.Athlete

  action_fallback FartlekWeb.FallbackController

  def index(conn, _params) do
    athletes = Athletes.list_athletes()
    render(conn, "index.json", athletes: athletes)
  end

  def create(conn, %{"athlete" => athlete_params}) do
    with {:ok, %Athlete{} = athlete} <- Athletes.create_athlete(athlete_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.athlete_path(conn, :show, athlete))
      |> render("show.json", athlete: athlete)
    end
  end

  def show(conn, %{"id" => id}) do
    athlete = Athletes.get_athlete!(id)
    render(conn, "show.json", athlete: athlete)
  end

  def update(conn, %{"id" => id, "athlete" => athlete_params}) do
    athlete = Athletes.get_athlete!(id)

    with {:ok, %Athlete{} = athlete} <- Athletes.update_athlete(athlete, athlete_params) do
      render(conn, "show.json", athlete: athlete)
    end
  end

  def delete(conn, %{"id" => id}) do
    athlete = Athletes.get_athlete!(id)

    with {:ok, %Athlete{}} <- Athletes.delete_athlete(athlete) do
      send_resp(conn, :no_content, "")
    end
  end
end
