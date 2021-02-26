defmodule Fartlek.Repo.Migrations.CreateResults do
  use Ecto.Migration

  def change do
    create table(:results, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :race_id, references(:races, type: :uuid)
      add :athlete_id, references(:athletes, type: :uuid)
      add :total_time, :time
      add :status, :string

      timestamps()
    end

  end
end
