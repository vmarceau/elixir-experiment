defmodule Fartlek.Athletes.Athlete do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "athletes" do
    field :country, :string
    field :date_of_birth, :date
    field :first_name, :string
    field :last_name, :string

    timestamps()
  end

  @doc false
  def changeset(athlete, attrs) do
    athlete
    |> cast(attrs, [:first_name, :last_name, :country, :date_of_birth])
    |> validate_required([:first_name, :last_name, :country, :date_of_birth])
    |> validate_country()
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
