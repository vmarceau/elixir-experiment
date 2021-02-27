defmodule Fartlek.Repo.Migrations.CreateAthletes do
  use Ecto.Migration

  def change do
    create table(:athlete, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :first_name, :string
      add :last_name, :string
      add :country, :string
      add :date_of_birth, :date

      timestamps()
    end

  end
end
