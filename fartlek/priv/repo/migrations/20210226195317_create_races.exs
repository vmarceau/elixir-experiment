defmodule Fartlek.Repo.Migrations.CreateRaces do
  use Ecto.Migration

  def change do
    create table(:races, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :country, :string
      add :distance, :float
      add :total_ascent, :float

      timestamps()
    end

    create unique_index(:races, [:name])
  end
end
