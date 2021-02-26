defmodule Fartlek.Results.Result do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "results" do
    field :athlete_id, Ecto.UUID
    field :race_id, Ecto.UUID
    field :status, Ecto.Enum, values: [:ok, :dnf, :dns], default: :ok
    field :total_time, :time

    belongs_to :races, Fartlek.Races.Race
    belongs_to :athletes, Fartlek.Athletes.Athlete

    timestamps()
  end

  @doc false
  def changeset(result, attrs) do
    result
    |> cast(attrs, [:race_id, :athlete_id, :total_time, :status])
    |> validate_required([:race_id, :athlete_id, :total_time])
    |> unique_constraint([:race_id, :athlete_id], [name: "results_athlete_id_race_id_index"])
    |> foreign_key_constraint(:athlete_id)
    |> foreign_key_constraint(:race_id)
  end
end
