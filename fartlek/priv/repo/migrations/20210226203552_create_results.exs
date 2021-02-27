defmodule Fartlek.Repo.Migrations.CreateResults do
  use Ecto.Migration

  def change do
    create table(:result, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :year, :integer
      add :race_id, references(:race, type: :uuid)
      add :athlete_id, references(:athlete, type: :uuid)
      add :total_time, :time
      add :status, :string

      timestamps()
    end

    create unique_index(:result, [:year, :athlete_id, :race_id])
  end
end
