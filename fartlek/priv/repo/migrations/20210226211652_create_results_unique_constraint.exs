defmodule Fartlek.Repo.Migrations.CreateResultsUniqueConstraint do
  use Ecto.Migration

  def change do
    create unique_index(:results, [:athlete_id, :race_id])
  end

end
