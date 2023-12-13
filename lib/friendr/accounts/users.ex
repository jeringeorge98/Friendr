defmodule Friendr.Accounts.Users do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :current_location, :string
    field :name, :string
    field :username, :string
    field :password, :string
    field :email, :string
    field :dob, :date
    field :phone_number, :string
    field :about_me, :string
    field :interests, :string
    field :dislikes, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:name, :email, :username, :password, :dob, :phone_number, :about_me, :current_location, :interests, :dislikes])
    |> validate_required([:name, :email, :username, :password, :dob, :phone_number, :about_me, :current_location, :interests, :dislikes])
  end
end
