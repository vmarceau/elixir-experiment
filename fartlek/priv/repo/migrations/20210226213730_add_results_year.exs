defmodule Fartlek.Repo.Migrations.AddResultsYear do
  use Ecto.Migration

  def change do
    alter table(:results) do
      add :year, :integer
    end

    create unique_index(:results, [:year, :athlete_id, :race_id])
    drop unique_index(:results, [:athlete_id, :race_id])
  end
end
