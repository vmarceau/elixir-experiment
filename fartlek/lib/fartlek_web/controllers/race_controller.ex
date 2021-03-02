defmodule FartlekWeb.RaceController do
  use FartlekWeb, :controller

  alias Fartlek.Races
  alias Fartlek.Races.Race

  action_fallback FartlekWeb.FallbackController

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    races = Races.list_races()
    render(conn, "index.json", races: races)
  end

  def create(conn, %{"race" => race_params}) do
    with {:ok, %Race{} = race} <- Races.create_race(race_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.race_path(conn, :show, race))
      |> render("show.json", race: race)
    end
  end

  def show(conn, %{"id" => id}) do
    race = Races.get_race!(id)
    render(conn, "show.json", race: race)
  end

  def show_results(conn, %{"id" => id}) do
    year =
      case conn.query_params do
        %{"year" => year} -> Integer.parse(year) |> elem(0)
        _ -> nil
      end

    race = Races.get_race_results!(id, year)
    render(conn, "show_results.json", race: race)
  end

  def update(conn, %{"id" => id, "race" => race_params}) do
    race = Races.get_race!(id)

    with {:ok, %Race{} = race} <- Races.update_race(race, race_params) do
      render(conn, "show.json", race: race)
    end
  end

  def delete(conn, %{"id" => id}) do
    race = Races.get_race!(id)

    with {:ok, %Race{}} <- Races.delete_race(race) do
      send_resp(conn, :no_content, "")
    end
  end
end
