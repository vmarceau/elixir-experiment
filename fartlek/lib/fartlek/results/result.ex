defmodule Fartlek.Results.Result do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "result" do
    field :year, :integer
    field :status, Ecto.Enum, values: [:ok, :dnf, :dns], default: :ok
    field :total_time, :time

    belongs_to :race, Fartlek.Races.Race
    belongs_to :athlete, Fartlek.Athletes.Athlete

    timestamps()
  end

  @doc false
  def changeset(result, attrs) do
    result
    |> cast(attrs, [:year, :race_id, :athlete_id, :total_time, :status])
    |> validate_required([:year, :race_id, :athlete_id, :total_time])
    |> unique_constraint([:year, :race_id, :athlete_id],
      name: "result_year_athlete_id_race_id_index"
    )
    |> foreign_key_constraint(:athlete_id)
    |> foreign_key_constraint(:race_id)
  end
end
