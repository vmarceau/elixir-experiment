defmodule Fartlek.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:user, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :email, :string
      add :encrypted_password, :string
      add :display_name, :string

      timestamps()
    end

    create unique_index(:user, [:email])
  end
end
