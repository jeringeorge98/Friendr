defmodule Friendr.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Friendr.Accounts` context.
  """

  @doc """
  Generate a users.
  """
  def users_fixture(attrs \\ %{}) do
    {:ok, users} =
      attrs
      |> Enum.into(%{
        DoB: "some DoB",
        about_me: "some about_me",
        current_location: "some current_location",
        dislikes: "some dislikes",
        email: "some email",
        interests: "some interests",
        name: "some name",
        password: "some password",
        phone_number: "some phone_number",
        username: "some username"
      })
      |> Friendr.Accounts.create_users()

    users
  end
end
