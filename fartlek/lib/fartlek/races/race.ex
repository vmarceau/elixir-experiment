defmodule Fartlek.Races.Race do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "races" do
    field :country, :string
    field :distance, :float
    field :name, :string
    field :total_ascent, :float

    timestamps()
  end

  @doc false
  def changeset(race, attrs) do
    race
    |> cast(attrs, [:name, :country, :distance, :total_ascent])
    |> validate_required([:name, :country, :distance, :total_ascent])
    |> validate_country()
    |> unique_constraint(:name)
  end

  def validate_country(changeset) do
    country = get_field(changeset, :country)

    if Countries.exists?(:alpha3, country) do
      changeset
    else
      add_error(changeset, :country, "invalid country identifier")
    end
  end
end
