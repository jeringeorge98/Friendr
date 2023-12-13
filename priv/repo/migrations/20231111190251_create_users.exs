defmodule Friendr.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string, size: 200
      add :email, :string, size: 50, primary_key: true
      add :username, :string, size: 50
      add :password, :string, size: 128
      add :dob, :date
      add :phone_number, :string, size: 15
      add :about_me, :string, size: 500
      add :current_location, :string, size: 30
      add :interests, :string, size: 250
      add :dislikes, :string, size: 250

      timestamps(type: :utc_datetime)
    end
    create unique_index(:users, [:email])
  end
end
